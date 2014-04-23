#!/usr/bin/env bash

##############################################
# EXAMPLE OF LOCAL FILE (baseq3path.local.sh #
##############################################
#basepath="/usr/local/games/ioquake3"
#arch="x86_64"
#buildDir="build/release-linux-$arch"
#cp -f $buildDir/renderer_opengl1_$arch.so $basepath
#cp -f $buildDir/baseq3/*.so $basepath/baseq3
#############################################

source baseq3path.local.sh

skill=5
botname="sarge"
uname="Stigmha"

./$buildDir/ioquake3.$arch +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath $basepath +set virtualClient 1 +set virtualClientSkill $skill +set virtualClientBot $botname +set virtualClientName $uname +connect 127.0.0.1
