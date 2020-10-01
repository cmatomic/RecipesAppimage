#!/bin/sh

wget -c http://pt.archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libavutil-ffmpeg54_2.8.17-0ubuntu0.1_amd64.deb
wget -c http://pt.archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libswresample-ffmpeg1_2.8.17-0ubuntu0.1_amd64.deb
wget -c http://pt.archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libavcodec-ffmpeg-extra56_2.8.17-0ubuntu0.1_amd64.deb
wget -c http://pt.archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libavcodec-extra_2.8.17-0ubuntu0.1_all.deb

for f in `ls -1 *.deb | sed 's/\(.*\)\..*/\1/'`
do
  dpkg-deb -x $f.deb $f
  dpkg-deb -e $f.deb $f/DEBIAN
done

find ./ -name 'libs*-*.so*'  | xargs cp -t .
find ./ -name 'libav*-*.so*'  | xargs cp -t .
