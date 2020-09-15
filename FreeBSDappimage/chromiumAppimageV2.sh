#!/bin/sh
#Before running this script you should install the following packages .
#  "squashfs-tools" "fusefs-squashfuse"
# https://forums.freebsd.org/threads/mksquashfs-unsquashfs-squashfuse.62445/
#change the name nomad for your user name and group  .
USER=nomad
GROUP=nomad
#GROUP=wheel
VERSION=chromium-84.0.4147.135
mkdir FreeBSDappimage
cd FreeBSDappimage
sudo pkg fetch  -d -o . $VERSION
sudo chown -R $USER:$GROUP All/
cd All
mkdir chromium.AppDir
ls *.txz | xargs -n1 tar  -C  "chromium.AppDir" -xzvf
cd chromium.AppDir

 cat > AppRun <<\EOF
#!/bin/sh
HERE=$(dirname $(readlink -f "${0}"))
export LD_PRELOAD="${HERE}/usr/local/lib/alsa-lib/libasound_module_pcm_oss.so"
HERE=$(dirname $(readlink -f "${0}"))
export LD_LIBRARY_PATH="${HERE}"/usr/local/lib:$PATH
"${HERE}"/usr/local/share/chromium/chrome  $@
EOF

  cat > chromium-browser.desktop <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Encoding=UTF-8
Name=Chromium
Comment=Google web browser based on WebKit
Icon=chrome
Exec=chrome %U
Categories=Application;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
StartupNotify=true
EOF

chmod a+x AppRun 
cp ./usr/local/share/icons/hicolor/256x256/apps/chrome.png  .

#VERSION=$(strings ./chromium-freebsd/chr | grep -e Chrome -C 5 | grep -e "^[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+"

cd ..
mkdir out 

mksquashfs chromium.AppDir $VERSION.squashfs -root-owned -noappend
cat runtime >> $VERSION.squashfs
cat $VERSION.squashfs >> $VERSION.AppImage

chmod a+x $VERSION.AppImage

mv $VERSION.AppImage ./out

#This script is just a demonstration to generate an appimage on FreeBSD and FreeBSD variants the end result does not generate a functional appimage, but it can run directly in the chromium.AppDir folder  " ./AppRun "  .
#LGPLv2.0

