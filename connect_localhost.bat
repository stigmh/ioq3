@echo off
:: set basepath="C:\Program Files (x86)\Steam\SteamApps\common\Quake 3 Arena"
call baseq3path.local.bat
.\build\quake3_debug\ioquake3.x86.exe +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath %basepath% +connect 127.0.0.1
