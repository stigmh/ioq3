#!/usr/bin/env bash
#basepath="/usr/local/games/ioquake3/"
source baseq3path.local.sh

uname="Stigmha"
model="sarge/krusade"

./build/release-linux-x86_64/ioquake3.x86_64 +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath $basepath +set team_headmodel $model +set team_model $model +set headmodel $model +set model $model +set name $uname +connect 127.0.0.1
