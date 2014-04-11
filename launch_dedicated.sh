#!/usr/bin/env bash

# EXAMPLE OF LOCAL FILE:
#basepath="/usr/local/games/ioquake3"
#cp -f build/release-linux-x86_64/renderer_opengl1_x86_64.so $basepath
#cp -f build/release-linux-x86_64/baseq3/*.so $basepath/baseq3

source baseq3path.local.sh

cp -f dedicated_server.cfg $basepath/baseq3
./build/release-linux-x86_64/ioq3ded.x86_64 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath $basepath +exec dedicated_server.cfg
