@echo off
:: set basepath="C:\Program Files (x86)\Steam\SteamApps\common\Quake 3 Arena"
call baseq3path.local.bat

set uname=Stigmha
set model="sarge/krusade"

.\build\quake3_debug\ioquake3.x86.exe +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath %basepath% +set team_headmodel %model% +set team_model %model% +set headmodel %model% +set model %model% +set name %uname% +connect 127.0.0.1
