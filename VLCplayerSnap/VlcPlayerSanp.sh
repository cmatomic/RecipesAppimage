#!/usr/bin/env bash

# env


mkdir VLCsnapBuild
cd VLCsnapBuild
snap download vlc
file-roller -h vlc_*
mv vlc_* mv VlcPlayer-snap.AppDir
