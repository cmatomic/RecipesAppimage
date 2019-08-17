#!/bin/sh
mkdir BuildHandBrake
cd BuildHandBrake
apt update
apt-get install autoconf automake build-essential cmake git libass-dev libbz2-dev libfontconfig1-dev libfreetype6-dev libfribidi-dev libharfbuzz-dev libjansson-dev liblzma-dev libmp3lame-dev libnuma-dev libogg-dev libopus-dev libsamplerate-dev libspeex-dev libtheora-dev libtool libtool-bin libvorbis-dev libx264-dev libxml2-dev libvpx-dev m4 make patch pkg-config python tar yasm zlib1g-dev gstreamer1.0-libav intltool libappindicator-dev libdbus-glib-1-dev libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgtk-3-dev libgudev-1.0-dev libnotify-dev libwebkitgtk-3.0-dev libva-dev libdrm-dev


wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz
tar xf *.tar.xz
cd nasm-*
./configure
make j4
make install
cd ..
git clone https://github.com/HandBrake/HandBrake.git && cd HandBrake

./configure --launch-jobs=$(nproc) --launch  --enable-qsv

make --directory=build install
