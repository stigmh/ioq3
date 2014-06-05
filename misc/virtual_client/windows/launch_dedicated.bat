@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::
:: EXAMPLE OF LOCAL FILE (baseq3path.local.bat) ::
::::::::::::::::::::::::::::::::::::::::::::::::::
::set basepath="C:\Program Files (x86)\Steam\SteamApps\common\Quake 3 Arena"
::set arch=x86
::set target=debug
::set buildPath=..\..\..\build
:::::::::::::::::::::::::::::::::::::::::::::::::::

call baseq3path.local.bat

copy /Y ..\dedicated_server.cfg %basepath%\baseq3
.\%buildPath%\ioquake3_dedicated_%target%\ioq3ded.%arch%.exe +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath %basepath% +exec dedicated_server.cfg
