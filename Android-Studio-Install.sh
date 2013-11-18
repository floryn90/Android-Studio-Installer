#!/bin/bash


echo "Downloading Android Studio bundle"

cd /tmp

wget http://dl.google.com/android/studio/android-studio-bundle-132.883541-linux.tgz -O Android-Studio.tgz

# Create the /opt dir if it doesn't exist
if [ ! -d /opt/ ]; then
        mkdir /opt/
fi



echo "Extracting Android Studio bundle to /opt"

#unzip -q AptanaStudio.zip -d /opt/
tar zxf Android-Studio.tgz -C /opt/



echo "Adding Android Studio desktop entry"

# Create the /usr/local/share/icons dir if it doesn't exist
if [ ! -d /usr/local/share/icons/ ]; then
        mkdir /usr/local/share/icons/
fi

# Fix for large icon problem
cp android-studio/bin/idea.png /usr/local/share/icons/android-studio.png


echo "[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Android Studio
GenericName=Android Studio bundle
Comment=Android Studio
Exec=/opt/android-studio/bin/studio.sh
TryExec=/opt/android-studio/bin/studio.sh
Icon=android-studio
Terminal=false
Type=Application
Categories=GNOME;Internet;" >> /tmp/Android-Studio.desktop
xdg-desktop-menu install /tmp/Android-Studio.desktop

echo "Android Studio bundle has been installed"
