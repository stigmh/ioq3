#!/usr/bin/env bash

## USAGE ##
# ./benchmark.sh <num virtual clients> <server> <server user> <output file> <round per benchmark>
# e.g.: ./benchmark.sh 34 nagios.nith.no root benchmark.out 10 

## Configuration ##
server=$2
user=$3
output=$4
numVCs=$1
defaultNumVCs=3
roundsPerBenchmark=$5
path=./ioquake3

if [[ -z $numVCs ]]; then
  numVCs=$defaultNumVCs
fi

if [[ -z $server ]]; then
  server=nagios.nith.no
fi

if [[ -z $user ]]; then
  user=root
fi

if [[ -z $output ]]; then
  output=benchmark.out
fi

if [[ -z $roundsPerBenchmark ]]; then
  let roundsPerBenchmark=10
fi

let numVCs=$numVCs+1

if [[ 0 -ge $numVCs ]]; then
  let numVCs=$defaultNumVCs
fi

## Functions ##
function getStats {
  echo $(ssh $user@$server "sp=/sys/class/net/eth0/statistics;rxb=rx_bytes;txb=tx_bytes;rxp=rx_packets;txp=tx_packets;rb1=\`cat \$sp/\$rxb\`;tb1=\`cat \$sp/\$txb\`;rp1=\`cat \$sp/\$rxp\`;tp1=\`cat \$sp/\$txp\`;sleep 1s;rb2=\`cat \$sp/\$rxb\`;tb2=\`cat \$sp/\$txb\`;rp2=\`cat \$sp/\$rxp\`;tp2=\`cat \$sp/\$txp\`;tpps=\`expr \$tp2 - \$tp1\`;rpps=\`expr \$rp2 - \$rp1\`;tbps=\`expr \$tb2 - \$tb1\`;rbps=\`expr \$rb2 - \$rb1\`;tkbps=\`expr \$tbps / 1024\`;rkbps=\`expr \$rbps / 1024\`;stats=\$(top -bn1 | grep \"$pid $user\" | awk '{print \$9,\$10}');echo \"\$stats \$rpps \$rkbps \$tpps \$tkbps\"")
}

## Launch server, retrieve PID ##
echo "Launching the dedicated server";

# Two ssh calls as ps x may be to fast for a single call
ssh $user@$server "cd $path; ./launch_dedicated.sh"
pid=$(ssh $user@$server "ps x | pgrep -n ioq3")

if [[ -z "$pid" ]]; then
  echo "Failed to start dedicated server."
  exit
fi

sleep 30s
echo "Server launched with pid: $pid"

## Log stats and launch clients ##
echo -e "vcs\tcpu\tmem\tpips\tikbs\tpops\tokbs" > $output

localPIDs=()

let counter=0;
while [ $numVCs -gt $counter ]; do
  if [ $counter -gt 0 ]; then
    echo "Launching Virtual Client #$counter"
    ./launch_multiple_vcs.sh 1 $server
    sleep 1s
    localPID=$(ps x | pgrep -n ioq)
    localPIDs+=($localPID)
    echo "Virtual client launched with PID: $localPID"
    
    let counter+=1
    echo "Launching Virtual Client #$counter"
    ./launch_multiple_vcs.sh 1 $server
    sleep 1s
    localPID=$(ps x | pgrep -n ioq)
    localPIDs+=($localPID)
    echo "Virtual client launched with PID: $localPID"
  fi

  echo "Benchmarking ..."

  let rounds=$roundsPerBenchmark
  
  cpuStats=0
  memStats=0
  pipStats=0
  kinStats=0
  popStats=0
  kouStats=0
  
  while [ $rounds -gt 0 ]; do
    rawData=$(getStats)
       
    cpuStats=$(echo "$cpuStats "$(echo $rawData | awk '{print $1}') | awk '{printf "%.2f", $1 + $2}')
    memStats=$(echo "$memStats "$(echo $rawData | awk '{print $2}') | awk '{printf "%.2f", $1 + $2}')
    pipStats=$(echo "$pipStats "$(echo $rawData | awk '{print $3}') | awk '{printf "%.2f", $1 + $2}')
    kinStats=$(echo "$kinStats "$(echo $rawData | awk '{print $4}') | awk '{printf "%.2f", $1 + $2}')
    popStats=$(echo "$popStats "$(echo $rawData | awk '{print $5}') | awk '{printf "%.2f", $1 + $2}')
    kouStats=$(echo "$kouStats "$(echo $rawData | awk '{print $6}') | awk '{printf "%.2f", $1 + $2}')
    
    if [ $rounds -ne $roundsPerBenchmark ]; then
      cpuStats=$(echo "$cpuStats 2" | awk '{printf "%.2f", $1 / $2}')
      memStats=$(echo "$memStats 2" | awk '{printf "%.2f", $1 / $2}')
      pipStats=$(echo "$pipStats 2" | awk '{printf "%.2f", $1 / $2}')
      kinStats=$(echo "$kinStats 2" | awk '{printf "%.2f", $1 / $2}')
      popStats=$(echo "$popStats 2" | awk '{printf "%.2f", $1 / $2}')
      kouStats=$(echo "$kouStats 2" | awk '{printf "%.2f", $1 / $2}')
    fi

    let rounds-=1
    sleep 1s
  done
  
  # Save results to disk
  echo -e "$counter\t$cpuStats\t$memStats\t$pipStats\t$kinStats\t$popStats\t$kouStats" >> $output

  echo "Done!"
  let counter+=1
done

#Terminate local running virtual clients
echo "Terminating local virtual clients"
for i in "${localPIDs[@]}"
do
  kill $i
done

# Terminate server
echo "Terminating server."
ssh $user@$server "kill -9 $pid"
