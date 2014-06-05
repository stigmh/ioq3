#!/usr/bin/env bash

server=ip_or_domain
user=server_user
output=benchmark.out
pid=$1

## Functions ##
function getStats {
  echo $(ssh $user@$server "sp=/sys/class/net/eth0/statistics;rxb=rx_bytes;txb=tx_bytes;rxp=rx_packets;txp=tx_packets;rb1=\`cat \$sp/\$rxb\`;tb1=\`cat \$sp/\$txb\`;rp1=\`cat \$sp/\$rxp\`;tp1=\`cat \$sp/\$txp\`;sleep 1s;rb2=\`cat \$sp/\$rxb\`;tb2=\`cat \$sp/\$txb\`;rp2=\`cat \$sp/\$rxp\`;tp2=\`cat \$sp/\$txp\`;tpps=\`expr \$tp2 - \$tp1\`;rpps=\`expr \$rp2 - \$rp1\`;tbps=\`expr \$tb2 - \$tb1\`;rbps=\`expr \$rb2 - \$rb1\`;tkbps=\`expr \$tbps / 1024\`;rkbps=\`expr \$rbps / 1024\`;stats=\$(top -bn1 | grep \"$pid $user\" | awk '{print \$9,\$10}');echo \"\$stats \$rpps \$rkbps \$tpps \$tkbps\"")
}

if [[ -z $pid ]]; then
  ## Launch server, retrieve PID ##
  echo "Launching the dedicated server";

  # Two ssh calls as ps x may be to fast for a single call
  ssh $user@$server "cd /usr/local/games/ioquake3; ./launch_dedicated.sh"
  pid=$(ssh $user@$server "ps x | pgrep ioq3")

  if [[ -z "$pid" ]]; then
    echo "Failed to start dedicated server."
    exit
  fi
  
  echo "Dedicated server launched with pid: $pid"
  echo "CPU MEM InPps InKbs OutPps OutKbs" > $output
fi

echo "Benchmarking ..."
## Log stats and launch clients ##
echo $(getStats) >> $output
echo "Done"
