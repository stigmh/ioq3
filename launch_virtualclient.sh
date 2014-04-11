#!/usr/bin/env bash
#basepath="/usr/local/games/ioquake3/"
source baseq3path.local.sh

skill=5
botname="sarge"
uname="Stigmha"

./build/release-linux-x86_64/ioquake3.x86_64 +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath $basepath +set virtualClient 1 +set virtualClientSkill $skill +set virtualClientBot $botname +set virtualClientName $uname +connect 127.0.0.1
