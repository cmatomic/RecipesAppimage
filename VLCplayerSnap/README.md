#/bin/sh
##VLC player 3.0.7
##This script will import VLCplayer from the snap repository and convert it to an Appimage :D
##The following sequence of commands will download the necessary files and execute them to generate the VLC player appimage, then you can access the VLCscript / out folder and click on the VLC appimage.
##In some distros it is necessary to install  "wget" "fuse"

mkdir VLCscript;cd VLCscript;wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VLCplayerSnap/VlcPlayerSnap.sh;chmod +x Vlc*.sh;./Vlc*.sh
