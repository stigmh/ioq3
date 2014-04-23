@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::
:: EXAMPLE OF LOCAL FILE (baseq3path.local.bat) ::
::::::::::::::::::::::::::::::::::::::::::::::::::
::set basepath="C:\Program Files (x86)\Steam\SteamApps\common\Quake 3 Arena"
::set arch=x86
::set target=debug
::copy /Y build\cgame_%target%\cgame%arch%.dll %basepath%\baseq3
::copy /Y build\game_%target%\qagame%arch%.dll %basepath%\baseq3
::copy /Y build\q3_ui_%target%\ui%arch%.dll %basepath%\baseq3
::copy /Y build\renderer_opengl1_%target%\renderer_opengl1_%arch%.dll %basepath%
:::::::::::::::::::::::::::::::::::::::::::::::::::

call baseq3path.local.bat

copy /Y dedicated_server.cfg %basepath%\baseq3
.\build\ioquake3_dedicated_%target%\ioq3ded.%arch%.exe +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath %basepath% +exec dedicated_server.cfg
