#! /bin/bash
mkdir kodibuild;cd kodibuild;wget https://raw.githubusercontent.com/AppImage/AppImages/master/pkg2appimage; mv pkg2appimage pkg2appimage.sh;chmod +x pkg2appimage.sh;wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/Kodi-stableXenial.yml ; ARCH=x86_64 ./pkg2appimage.sh Kodi-stableXenial.yml
