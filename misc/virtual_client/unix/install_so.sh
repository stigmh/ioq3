#!/usr/bin/env bash

source baseq3path.local.sh

cp -fv $buildDir/renderer_opengl1_$arch.$dynamicLib $basepath
cp -fv $buildDir/baseq3/*.$dynamicLib $basepath/baseq3
