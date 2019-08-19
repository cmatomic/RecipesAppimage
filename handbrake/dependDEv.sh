#!/bin/sh

wget https://www.nasm.us/pub/nasm/releasebuilds/2.13/nasm-2.13.tar.xz
tar xf *.tar.xz
cd nasm-*
./configure
make j4
sudo make install
cd ..

wget http://archive.ubuntu.com/ubuntu/pool/main/h/harfbuzz/harfbuzz_1.7.2.orig.tar.bz2
tar -jxvf harfbuzz_1.7.2.orig.tar.bz2
cd harfbuzz-1.7.2
./configure
chmod +x autogen.sh
./autogen.sh
sudo make install
cd ..

