#!/bin/sh

wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz
tar xf *.tar.xz
cd nasm-*
./configure
make j4
sudo make install
cd ..
wget http://archive.ubuntu.com/ubuntu/pool/main/h/harfbuzz/harfbuzz_1.7.2.orig.tar.bz2
tar xf *.tar.bz2
./configure
./autogen.sh
sudo make install
cd ..
