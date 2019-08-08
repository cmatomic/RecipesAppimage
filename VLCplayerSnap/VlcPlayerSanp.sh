#!/bin/sh
# run in Ubunu xenial 16.04


mkdir VLCsnapBuild
cd VLCsnapBuild
mkdir out
snap download vlc
file-roller -h vlc_*.snap
mv vlc_*/ VlcPlayerSnap.AppDir/
cd VlcPlayerSnap.AppDir
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/AppRun
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.desktop
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.png
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.wrapper
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcSnapAppimage/vlc.appdata.xml
chmod +x AppRun
rm  /VLCsnapBuild/VlcPlayerSnap.AppDir/usr/bin/vlc.wrapper
rm /VLCsnapBuild/VlcPlayerSnap.AppDir/usr/share/metainfo/vlc.appdata.xml
chmod +x vlc.wrapper
mv vlc.wrapper/VLCsnapBuild/VlcPlayerSnap.AppDir/usr/bin/
mv vlc.appdata.xml /VLCsnapBuild/VlcPlayerSnap.AppDir/usr/share/metainfo/
cd ..
wget https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-x86_64.AppImage
chmod +x *.AppImage
./appimagetool-x86_64.AppImage VlcPlayerSnap.AppDir
mv VlcPlayerSnap.AppImage /out
cd out
chmod +x VlcPlayerSnap.AppImage
