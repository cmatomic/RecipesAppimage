### Unofficial AppImage vivaldi-stable 64 bits
* ApImage can only be generated on ubutuntu xennial
This sequence of commands will download the necessary files and execute them to generate the Unofficial vivaldi-stable , then you can access the buildvivaldiStable / out folder and click on the generated appimage.

* ### vivaldi-stable 64 bits 
```
mkdir buildvivaldiStable;cd buildvivaldiStable;wget https://raw.githubusercontent.com/AppImage/AppImages/master/pkg2appimage; mv pkg2appimage pkg2appimage.sh;chmod +x pkg2appimage.sh;wget https://raw.githubusercontent.com/cmatomic/RecipesAppimage/master/VivaldiBrowser/VivaldiBrowser.yml;ARCH=x86_64 ./pkg2appimage.sh VivaldiBrowser.yml

```
