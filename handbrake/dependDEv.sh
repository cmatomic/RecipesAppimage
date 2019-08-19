#!/bin/sh

wget https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.xz
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
wget http://archive.ubuntu.com/ubuntu/pool/main/g/gtk+3.0/gtk+3.0_3.22.30.orig.tar.xz
tar xf gtk+-3.22.30.tar.xz          # unpack the sources
cd gtk+-3.22.30                     # change to the toplevel directory
./configure                         # run the `configure' script
cd build                            
make                                # build GTK+
sudo make install                   # install GTK+
cd ..

