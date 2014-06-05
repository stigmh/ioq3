#!/usr/bin/env bash

source baseq3path.local.sh

cp -fv $buildDir/renderer_opengl1_$arch.so $basepath
cp -fv $buildDir/baseq3/*.so $basepath/baseq3
