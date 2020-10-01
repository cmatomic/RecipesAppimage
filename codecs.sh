#!/bin/sh
(
wget -c http://pt.archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libavutil-ffmpeg54_2.8.17-0ubuntu0.1_amd64.deb
wget -c http://pt.archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libswresample-ffmpeg1_2.8.17-0ubuntu0.1_amd64.deb
wget -c http://pt.archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libavcodec-ffmpeg-extra56_2.8.17-0ubuntu0.1_amd64.deb
wget -c http://pt.archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libavcodec-extra_2.8.17-0ubuntu0.1_all.deb
)
(
dpkg  --extract libavutil-ffmpeg54_2.8.17-0ubuntu0.1_amd64.deb .
)
dpkg --extract libswresample-ffmpeg1_2.8.17-0ubuntu0.1_amd64.deb .
(
dpkg --extract libavcodec-ffmpeg-extra56_2.8.17-0ubuntu0.1_amd64.deb .
)
(
dpkg --extract libavcodec-extra_2.8.17-0ubuntu0.1_all.deb .
)
