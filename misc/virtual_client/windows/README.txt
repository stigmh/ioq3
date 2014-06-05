This directory contains various bat files for the automation of various tasks related to virtual clients and development. You have to create a local file defining the basepath of Quake III Arena before you are able to use the scripts. Name the file "baseq3path.local.bat" and it should at least contain the following:

set basepath="C:\Program Files (x86)\Steam\SteamApps\common\Quake 3 Arena"
set arch=x86
set target=debug
set buildPath=..\..\..\build

--------------------------------
-------------------------------

install_dll.bat

  This script should be run after building the engine or any of the QVMs.
  It copies all the dlls (dynamic libraries) to the proper location.

launch_virtualclient.bat

  Launches a single virtual client. See the file for configuration.

launch_multiple_vcs.bat

  Launches multiple virtual clients. See the file for configuration.

launch_dedicated.bat

  Launches a normal dedicated ioquake3 server with the configuration available
  in ../dedicated_server.cfg.

connect_localhost.bat

  Launches the game and connects to a server on the local machine.