@echo off
set basepath="C:\Program Files (x86)\Steam\SteamApps\common\Quake 3 Arena"
copy /Y dedicated_server.cfg %basepath%\baseq3
.\build\ioquake3_dedicated_debug\ioq3ded.x86.exe +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath %basepath% +exec dedicated_server.cfg
