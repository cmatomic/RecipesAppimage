### Unofficial AppImage vivaldi-stable 64 bits
 * Script compatible with distributions based on Debian
  ¹ dependencies: wget ; binutils ; imagemagick
   
 * For distributions based on Fedora
 ¹ dependencies:
  dpkg ; binutils ; imagemagick  .
 
 * other distributions
 ¹ dependencies:
 dpkg ; dpkg-deb ; wget ; grep ; sed ;  binutils ; imagemagick
  
     ¹(this dependencies is need for  generate the AppImage )
 
 This sequence of commands will download the necessary files and execute them to generate the Unofficial vivaldi-stable AppImage, then you can access the  buildvivaldiStable/out folder and click on the generated appimage.

* ### vivaldi-stable 64 bits 
```
mkdir buildvivaldiStable;cd buildvivaldiStable;wget -q -c https://github.com/$(wget -q https://github.com/AppImage/pkg2appimage/releases -O - | grep "pkg2appimage-.*-x86_64.AppImage" | head -n 1 | cut -d '"' -f 2);chmod +x pkg2appimage-*-x86_64.AppImage;wget https://github.com/cmatomic/pkg2appimage/blob/master/recipes/Vivaldi.yml;./pkg2appimage-*-x86_64.AppImage Vivaldi.yml
```
* ###  Firejail vivaldi-stable
to sandbox a AppImage install Firejail 
https://firejail.wordpress.com/

```
firejail --appimage --private ./Vivaldi-*-x86_64.AppImage --no-sandbox
```
