@echo off
setlocal
call baseq3path.local.bat

set /a numClients=%1%
set server=%2%

if "%numClients%" == "" (
  set /a numClients=2
)

if "%server%" == "" (
  set server=127.0.0.1
)

set clientNamePrefix=VC_

set numClients=2
set bots=anarki biker bitterman bones crash doom grunt hunter keel klesk lucy major mynx orbb ranger razor sarge slash sorlag tankjr uriel visor xaero
set numBots=22
set loopCounter=0

:loop
set /a skill=(5*%random%)/32768+1
set /a randBot=(numBots*%random%)/32768+1
for /f "tokens=%randBot%" %%f in ("%bots%") do set name=%%f 

START /B .\build\quake3_debug\ioquake3.x86.exe +set r_fullscreen 0 +set sv_pure 0 +set vm_ui 0 +set vm_game 0 +set vm_cgame 0 +set fs_basepath %basepath% +set virtualClient 2 +set virtualClientSkill %skill% +set virtualClientBot %name% +set virtualClientName %clientNamePrefix%%loopCounter% +connect %server% >nul 2>nul

set /a loopCounter+=1
set /a numClients-=1
if %numClients% GTR 0 goto loop