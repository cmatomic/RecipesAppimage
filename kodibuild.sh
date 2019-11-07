#!/bin/bash
apt update
apt install python-software-properties software-properties-common
cp /etc/apt/sources.list /etc/apt/sources.list~
sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
apt update
add-apt-repository -s ppa:team-xbmc/xbmc-nightly
add-apt-repository -s ppa:team-xbmc/xbmc-ppa-build-depends
apt build-dep kodi
apt install ccache
apt install libcec4-dev libfmt3-dev liblircclient-dev  libglew-dev libwayland-dev libxkbcommon-dev waylandpp-dev wayland-protocols libgbm-dev libinput-dev libxkbcommon-dev install doxygen libcap-dev libsndio-dev libmariadbd-dev

(

cd home
mkdir kodi-build
mkdir kodi.AppDir
chmod  755 -R kodi-build
git clone -b Krypton https://github.com/xbmc/xbmc kodi
chmod  755 -R kodi
cd/home/kodi-build
cmake ../kodi -DCMAKE_INSTALL_PREFIX=/home/kodi.AppDir
cmake --build . -- VERBOSE=1 -j$(getconf _NPROCESSORS_ONLN)

)


(

cd /home/kodi
make -j$(getconf _NPROCESSORS_ONLN) -C tools/depends/target/binary-addons PREFIX=$HOME/kodi.AppDir ADDONS=" audiodecoder.2sf audiodecoder.asap audiodecoder.dumb audiodecoder.fluidsynth audiodecoder.gme audiodecoder.gsf audiodecoder.modplug audiodecoder.ncsf audiodecoder.nosefart audiodecoder.openmpt audiodecoder.organya audiodecoder.qsf audiodecoder.sidplay audiodecoder.snesapu audiodecoder.ssf audiodecoder.stsound audiodecoder.timidity audiodecoder.upse audiodecoder.vgmstream audiodecoder.wsr audiodsp.freesurround audioencoder.flac audioencoder.lame audioencoder.vorbis audioencoder.wav game.libretro imagedecoder.mpo imagedecoder.raw inputstream.adaptive peripheral.joystick pvr.argustvpvr.demo pvr.dvblink pvr.dvbviewer pvr.filmon pvr.hdhomerun pvr.hts pvr.iptvsimple pvr.mediaportal.tvserver pvr.mythtv pvr.nextpvr pvr.njoy pvr.octonet pvr.pctv pvr.sledovanitv.cz pvr.stalker pvr.teleboy pvr.vbox pvr.vdr.vnsi pvr.vupluspvr.wmc pvr.zattoo screensaver.asteroids screensaver.biogenesis screensaver.greynetic screensaver.matrixtrails screensaver.pingpong screensaver.pyro screensaver.stars vfs.libarchive vfs.nfs vfs.rar vfs.sacd vfs.sft pvisualization.goom visualization.shader toyvisualization.spectrum visualization.waveform "

)


cd /home

cd /home/kodi-build

wget https://github.com/cmatomic/RecipesAppimage/raw/master/kodi.png

wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/AppRun2

mv AppRun2  AppRun

chmod +x AppRun

wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/kodi.desktop

cd /home

wget https://github.com/cmatomic/RecipesAppimage/raw/master/VLCplayerSnap/appimagetool

chmod +x appimagetool

./appimagetool --no-appstream kodi.AppDir




wget https://github.com/cmatomic/RecipesAppimage/raw/master/VLCplayerSnap/appimagetool

chmod +x appimagetool

./appimagetool --no-appstream kodi.AppDir


