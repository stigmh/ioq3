#!/usr/bin/env bash

###############################################
# EXAMPLE OF LOCAL FILE (baseq3path.local.sh) #
###############################################
#basepath="/usr/local/games/ioquake3"
#arch="x86_64"
#buildDir="../../../build/release-linux-$arch"
##############################################

source baseq3path.local.sh

cp -f ../dedicated_server.cfg $basepath/baseq3
./$buildDir/ioq3ded.$arch +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath $basepath +exec dedicated_server.cfg
