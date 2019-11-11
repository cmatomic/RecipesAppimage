#/bin/sh
#handbrake-amd64

NASM=2.14.02
GTTEXT=0.20.1
HDBK=1.2.2

update
sudo apt-get install autoconf automake build-essential cmake git libass-dev libbz2-dev libfontconfig1-dev libfreetype6-dev libfribidi-dev libharfbuzz-dev libjansson-dev liblzma-dev libmp3lame-dev libogg-dev libopus-dev libsamplerate-dev libspeex-dev libtheora-dev libtool libtool-bin libvorbis-dev libx264-dev libxml2-dev m4 make nasm patch pkg-config python tar yasm zlib1g-dev gstreamer1.0-libav intltool libappindicator-dev libdbus-glib-1-dev libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgtk-3-dev libgudev-1.0-dev libnotify-dev libwebkitgtk-3.0-dev meson python3-pip libnuma-dev autopoint doxygen libvpx-dev  libva-dev libvdpau-dev gtk-doc-tools libgirepository1.0-dev libmutter-dev
pip3 install meson

(
  wget https://www.nasm.us/pub/nasm/releasebuilds/$NASM/nasm-$NASM.tar.gz
  tar xvf nasm-*
  cd nas-*
  #./autogen.sh
  ./configure --prefix=/usr 
  make -j$(nproc)
  make -j$(nproc) install
)

(
  wget https://ftp.gnu.org/pub/gnu/gettext/gettext-$GTTEXT.tar.gz
  cd gettext-*
  ./autogen.sh 
  ./configure --prefix=/usr 
  make -j$(nproc)
  make -j$(nproc) install
)

(
  git clone https://github.com/webmproject/libvpx.git
  cd libvpx
  mkdir build
  cd build
  ../configure --prefix=/usr 
  make -j$(nproc)
  make -j$(nproc) install

)



(
  git clone https://github.com/FFmpeg/FFmpeg.git
  cd FFmpeg 
  ./configure --prefix=/usr 
  make -j$(nproc)
  make -j$(nproc) install

)

(

  mkdir HandBrake.AppDir
  wget https://download.handbrake.fr/releases/$HDBK/HandBrake-$HDBK-source.tar.bz2
  tar xfv HandBrake-*
  cd HandBrake-*
  ./configure --launch-jobs=$(nproc) --launch --build="build" --prefix=/usr --enable-fdk-aac --enable-numa --enable-x265 --debug --arch=x86_64
  make --directory=build install
 
)


#./configure --launch-jobs=$(nproc) --launch --build="build" --prefix=/usr --enable-fdk-aac --enable-numa --enable-x265


#./configure --launch-jobs=$(nproc) --launch --enable-qsv  --debug --arch=x86_64 --force

#apt install golang

#https://github.com/HandBrake/HandBrake/issues/2295



