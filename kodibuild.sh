#!/bin/bash
# for docker
apt update
apt install nano
apt install python-software-properties software-properties-common
cp /etc/apt/sources.list /etc/apt/sources.list~
sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
apt update
cd home
mkdir kodibuild ; chmod 755 kodibuild ; cd kodibuild
git clone -b Krypton https://github.com/xbmc/xbmc kodi
cd kodi
add-apt-repository -s ppa:team-xbmc/xbmc-nightly
add-apt-repository -s ppa:team-xbmc/xbmc-ppa-build-depends
apt build-dep kodi
apt install ccache
apt install libcec4-dev libfmt3-dev liblircclient-dev  libglew-dev libwayland-dev libxkbcommon-dev waylandpp-dev wayland-protocols libgbm-dev libinput-dev libxkbcommon-dev install doxygen libcap-dev libsndio-dev libmariadbd-dev
make -C tools/depends/target/crossguid PREFIX=/usr/local
make -C tools/depends/target/flatbuffers PREFIX=/usr/local
make -C tools/depends/target/libfmt PREFIX=/usr/local
mkdir kodi-build
cd build
cmake ../kodi -DCMAKE_INSTALL_PREFIX=/usr/local
cmake --build . -- VERBOSE=1 -j$(getconf _NPROCESSORS_ONLN)
make -j$(getconf _NPROCESSORS_ONLN) -C tools/depends/target/binary-addons PREFIX=/usr/local
cd ..
mv kodi-build kodi.AppDir

wget https://github.com/cmatomic/RecipesAppimage/raw/master/VLCplayerSnap/appimagetool

chmod +x appimagetool

./appimagetool --no-appstream kodi.AppDir
