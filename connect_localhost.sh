#!/usr/bin/env bash

###############################################
# EXAMPLE OF LOCAL FILE (baseq3path.local.sh) #
###############################################
#basepath="/usr/local/games/ioquake3"
#arch="x86_64"
#buildDir="build/release-linux-$arch"
##############################################

source baseq3path.local.sh

uname="Stigmha"
model="sarge/krusade"

./$buildDir/ioquake3.$arch +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath $basepath +set team_headmodel $model +set team_model $model +set headmodel $model +set model $model +set name $uname +connect 127.0.0.1
