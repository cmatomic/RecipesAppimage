#!/bin/sh
# need Snappy (package manager),file-roller
# tested in Ubunu xenial 16.04

mkdir VLCsnapBuild
chmod 755 VLCsnapBuild
cd VLCsnapBuild
mkdir out
snap download vlc
file-roller -h vlc_*.snap
mv vlc_*/ VlcPlayerSnap-x86_64.AppDir/

wget  https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/AppRun -P Vlc*

wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.desktop -P Vlc*

wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.png -P Vlc*

wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.wrapper

wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.appdata.xml

chmod +x Vlc*/AppRun
chmod +x vlc.wrapper
mv -f vlc.wrapper Vlc*/usr/bin/
mv -f vlc.appdata.xml Vlc*/usr/share/metainfo/

wget https://github.com/cmatomic/RecipesAppimage/raw/master/VLCplayerSnap/appimagetool

chmod +x appimagetool
./appimagetool --no-appstream VlcPlayerSnap-x86_64.AppDir
mv VLC-x86_64.AppImage VlcPlayerSnap-x86_64.AppImage
mv VlcPlayerSnap-x86_64.AppImage out/
cd out
chmod +x VlcPlayerSnap-x86_64.AppImage
