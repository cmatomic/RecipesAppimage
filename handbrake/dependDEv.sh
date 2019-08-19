#!/bin/sh
wget http://archive.ubuntu.com/ubuntu/pool/main/g/gobject-introspection/gobject-introspection_1.56.1.orig.tar.xz
tar xf gobject-introspection_1.56.1.orig.tar.xz
cd gobject-introspection-1.56.1
./configure
chmod +x autogen.sh
./autogen.sh
sudo make install
cd ..
wget http://archive.ubuntu.com/ubuntu/pool/main/a/atk1.0/atk1.0_2.18.0.orig.tar.xz
tar xf atk1.0_2.18.0.orig.tar.xz
cd atk-2.18.0
./configure                         
cd build                            
make                                
sudo make install                   
cd ...
wget http://archive.ubuntu.com/ubuntu/pool/main/p/pango1.0/pango1.0_1.38.1.orig.tar.xz
tar xf pango1.0_1.38.1.orig.tar.xz
cd pango-1.38.1
./configure                         
cd build                            
make                                
sudo make install                   
cd ...
wget http://archive.ubuntu.com/ubuntu/pool/main/c/cairo/cairo_1.14.6.orig.tar.xz
cd cairo-1.14.6
./configure                         
cd build                            
make                                
sudo make install                   
cd ...
wget http://archive.ubuntu.com/ubuntu/pool/main/g/gdk-pixbuf/gdk-pixbuf_2.32.2.orig.tar.xz
cd gdk-pixbuf-2.32.2
./configure                         
cd build                            
make                                
sudo make install                   
cd ...

wget http://archive.ubuntu.com/ubuntu/pool/main/g/gtk+3.0/gtk+3.0_3.22.30.orig.tar.xz
tar xf gtk+3.0_3.22.30.orig.tar.xz  # unpack the sources
cd gtk+-3.22.30                     # change to the toplevel directory
./configure                         # run the `configure' script
cd build                            
make                                # build GTK+
sudo make install                   # install GTK+
cd ..

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

