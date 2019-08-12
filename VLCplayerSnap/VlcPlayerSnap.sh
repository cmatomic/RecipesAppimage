#!/bin/sh
# VLC version import from snap ubuntu 
# Script tested in Ubunu xenial 16.04
# after running this script then you can go to the ~out\ folder and click on the generated Vlc appimage
# 10-08-2019 "DDMMYY"

read -p "Do not run this script with sudo or as root, if this is the normal user answer Y to continue:" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

mkdir VLCsnapBuild
chmod 755 VLCsnapBuild
cd VLCsnapBuild
mkdir out

wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/squashfs-tools/squashfs-toolsUnion.yml
wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/SnapAppimage/SnapUnion.yml
wget https://raw.githubusercontent.com/AppImage/pkg2appimage/master/pkg2appimage

chmod +x pkg2appimage

$here ./pkg2appimage squashfs-toolsUnion.yml
$here ./pkg2appimage SnapUnion.yml
$here ./out/Snap-*.AppImage download vlc
$here ./out/squashfs-tools*.AppImage vlc_*.snap
mv squashfs-root/ VlcPlayerSnap-x86_64.AppDir/

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
mv VLC-*.AppImage VlcPlayerSnap-x86_64.AppImage
mkdir ../out
mv VlcPlayerSnap-x86_64.AppImage ../out
ls -lh ../out/*.AppImage
cd ../out
chmod +x Vlc*.AppImage
