#!/usr/bin/env bash

###############################################
# EXAMPLE OF LOCAL FILE (baseq3path.local.sh) #
###############################################
#basepath="/usr/local/games/ioquake3"
#arch="x86_64"
#buildDir="../../../build/release-linux-$arch"
##############################################

source baseq3path.local.sh

server=$1
vcMode=$2
uname=$3
skill=$4
botname=$5

if [[ -z $server ]]; then
  server=127.0.0.1
fi

if [[ -z $vcMode ]]; then
  vcMode=1
fi

if [[ -z $uname ]]; then
  uname="VirtualClient"
fi

if [[ -z $skill ]]; then
  skill=4
fi

if [[ -z $botname ]]; then
  botname="sarge"
fi

./$buildDir/ioquake3.$arch +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath $basepath +set virtualClient $vcMode +set virtualClientSkill $skill +set virtualClientBot $botname +set virtualClientName $uname +connect nagios.nith.no
