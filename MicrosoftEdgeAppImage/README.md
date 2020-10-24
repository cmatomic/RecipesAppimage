### Unofficial AppImage Microsoft Edge for GNU/Linux

  
ApImage can only be generated on ubutuntu xennial

* ### Microsoft Edge Dev 
```
mkdir buildMicrosoftEdge;cd buildMicrosoftEdge;wget https://raw.githubusercontent.com/AppImage/AppImages/master/pkg2appimage; mv pkg2appimage pkg2appimage.sh;chmod +x pkg2appimage.sh;wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/MicrosoftEdgeAppImage/microsoft-edge-dev.yml;ARCH=x86_64 ./pkg2appimage.sh microsoft-edge-dev.yml

```
