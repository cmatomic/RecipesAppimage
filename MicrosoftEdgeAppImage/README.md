### Unofficial AppImage Microsoft Edge for GNU/Linux
* Script compatible  with distributions based on Debian

This sequence of commands will download the necessary files and execute them to generate the Unofficial Edge Browser AppImage, then you can access the buildMicrosoftEdge / out folder and click on the generated appimage.

* ### Microsoft Edge Dev 
```
mkdir buildMicrosoftEdge;cd buildMicrosoftEdge;wget https://raw.githubusercontent.com/AppImage/AppImages/master/pkg2appimage; mv pkg2appimage pkg2appimage.sh;chmod +x pkg2appimage.sh;wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/MicrosoftEdgeAppImage/microsoft-edge-dev.yml;ARCH=x86_64 ./pkg2appimage.sh microsoft-edge-dev.yml

```
