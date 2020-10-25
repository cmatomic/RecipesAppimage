### Unofficial AppImage Microsoft Edge for GNU/Linux

 * Script compatible with distributions based on Debian
 
 This sequence of commands will download the necessary files and execute them to generate the Unofficial Edge Browser AppImage, then you can access the  buildMicrosoftEdge / out folder and click on the generated appimage.
 
 
* ### Microsoft Edge Dev 
```
mkdir buildMicrosoftEdge;cd buildMicrosoftEdge;wget -q -c https://github.com/$(wget -q https://github.com/AppImage/pkg2appimage/releases -O - | grep "pkg2appimage-.*-x86_64.AppImage" | head -n 1 | cut -d '"' -f 2);chmod +x pkg2appimage-*-x86_64.AppImage ;wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/MicrosoftEdgeAppImage/microsoft-edge-dev.yml;ARCH=x86_64 ./pkg2appimage-*-x86_64.AppImage microsoft-edge-dev.yml

```
