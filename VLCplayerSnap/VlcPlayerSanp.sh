#!/bin/sh
# run in Ubunu xenial 16.04


mkdir VLCsnapBuild
mkdir out
cd VLCsnapBuild
snap download vlc
file-roller -h vlc_*
mv vlc_* mv VlcPlayer-snap.AppDir
cd VlcPlayer-snap.AppDir
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/AppRun
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.desktop
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.png
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.wrapper
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.appdata.xml
chmod +x AppRun
rm /usr/bin/vlc.wrapper
rm /usr/share/metainfo/vlc.appdata.xml
chmod +x vlc.wrapper
mv vlc.wrapper /usr/bin
mv vlc.appdata.xml /usr/share/metainfo
cd ..
wget https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-x86_64.AppImage
chmod +x *.AppImage
./appimagetool-x86_64.AppImage VlcPlayer-snap.AppDir
mv VlcPlayer-snap.AppImage /out
cd out
chmod +x VlcPlayer-snap.AppImage
