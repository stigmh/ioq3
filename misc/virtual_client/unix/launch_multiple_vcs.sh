#!/usr/bin/env bash

###############################################
# EXAMPLE OF LOCAL FILE (baseq3path.local.sh) #
###############################################
#basepath="/usr/local/games/ioquake3"
#arch="x86_64"
#buildDir="../../../build/release-linux-$arch"
##############################################

source baseq3path.local.sh

numClients=$1
server=$2

if [[ -z $numClients ]]; then
  numClients=8
fi

if [[ -z $server ]]; then
  server="127.0.0.1"
fi

# Seed random generator
RANDOM=$$$(date +%s)

clientNamePrefix="VC_"

bots=(anarki biker bitterman bones crash doom grunt hunter keel klesk lucy major mynx orbb ranger razor sarge slash sorlag tankjr uriel visor xaero)
numBots=${#bots[*]} # number of bots in array
loopCounter=0

while [ $numClients -gt 0 ]; do
  let skill=($RANDOM%5)+1
  randBot=${bots[$RANDOM % $numBots]}
#  echo $randBot $skill $clientNamePrefix$loopCounter
  let numClients=numClients-1
  let loopCounter+=1
  
  ./$buildDir/ioquake3.$arch +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath $basepath +set virtualClient 2 +set virtualClientSkill $skill +set virtualClientBot $randBot +set virtualClientName $clientNamePrefix$loopCounter +connect $server >/dev/null 2>&1 &
  sleep 1s
done

#echo "All clients launched!"

