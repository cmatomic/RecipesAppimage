#!/bin/sh
#change the name nomad for your user name .
USER=nomad

mkdir FreeBSDappimage
cd FreeBSDappimage
sudo pkg fetch  -d -o . chromium-84.0.4147.135
sudo chown -R $USER:$USER All/
cd All
mkdir chromium.AppImage
ls *.txz | xargs -n1 tar  -C  "chromium.AppImage" -xzvf
cd chromium.AppImage

 cat > AppRun <<\EOF
#!/bin/sh
export LD_PRELOAD="${HERE}/usr/local/lib/alsa-lib/libasound_module_pcm_oss.so"

export GDK_PIXBUF_MODULEDIR="${HERE}/usr/local/lib/gdk-pixbuf-2.0/loaders"
export GDK_PIXBUF_MODULE_FILE="${HERE}/usr/loacl/lib/gdk-pixbuf-2.0/loaders.cache"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GDK_PIXBUF_MODULEDIR"
export GTK_PATH="$HERE/usr/local/lib/gtk-2.0"
export GTK_IM_MODULE_FILE="$HERE/usr/local/lib/gtk-2.0:$GTK_PATH"
export PANGO_LIBDIR="$HERE/usr/local/lib"

export PATH="${HERE}"/usr/local/bin:"${HERE}"/usr/local/sbin:"${HERE}"/usr/local/include/gtk-3.0/gdk:"${PATH}"
export LD_LIBRARY_PATH="${HERE}"/usr/local/lib/:"${LD_LIBRARY_PATH}"
export PYTHONPATH="${HERE}"/usr/local/lib/gobject-introspection/giscanner/doctemplates/Python:"${PYTHONPATH}"
export PYTHONHOME="${HERE}"/usr/
export XDG_DATA_DIRS="${HERE}"/usr/local/share/:"${XDG_DATA_DIRS}"
export PERLLIB="${HERE}"/usr/local/share/perl5/:"${HERE}"/usr/local/lib/perl5/:"${PERLLIB}"
export GSETTINGS_SCHEMA_DIR="${HERE}"/usr/local/share/glib-2.0/schemas/:"${GSETTINGS_SCHEMA_DIR}"
export QT_PLUGIN_PATH="${HERE}"/usr/local/lib/qt5/:"${HERE}"/usr/local/lib/qt5/plugins:"${QT_PLUGIN_PATH}"
export QT_DEBUG_PLUGINS=1
export LD_LIBRARY_PATH="${HERE}"_LIBRARY_PATH:$LD_LIBRARY_PATH
EXEC=$(grep -e '^Exec=.*' "${HERE}"/*.desktop | head -n 1 | cut -d "=" -f 2- | sed -e 's|%.||g')
exec ${EXEC} "$@"
EOF

  cat > chromium-browser.desktop <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Encoding=UTF-8
Name=Chromium
Comment=Google web browser based on WebKit
Icon=chrome
Exec=./usr/local/share/chromium/chrome %U
Categories=Application;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
StartupNotify=true
EOF

chmod a+x AppRun 
cp ./usr/local/share/icons/hicolor/256x256/apps/chrome.png  .
