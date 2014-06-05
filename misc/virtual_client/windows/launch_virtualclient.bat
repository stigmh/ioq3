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

set server=%1%
set /a vcMode=%2%
set uname=%3%
set /a skill=%4%
set botname=%5%

if "%server%" == "" (
  set server=127.0.0.1
)

if "%vcMode%" == "" (
  set /a vcMode=1
)

if "%uname%" == "" (
  set uname="VirtualClient"
)

if "%skill%" == "" (
  set /a skill=4
)

if "%botname%" == "" (
  set botname="sarge"
)

:: Add "2> vc_output.txt" at the end to capture output
.\%buildPath%\quake3_%target%\ioquake3.%arch%.exe +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath %basepath% +set virtualClient %vcMode% +set virtualClientSkill %skill% +set virtualClientBot %botname% +set virtualClientName %uname% +connect %server%
