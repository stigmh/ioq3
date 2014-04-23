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

set uname=Stigmha
set model="sarge/krusade"

.\build\quake3_%target%\ioquake3.%arch%.exe +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath %basepath% +set team_headmodel %model% +set team_model %model% +set headmodel %model% +set model %model% +set name %uname% +connect 127.0.0.1
