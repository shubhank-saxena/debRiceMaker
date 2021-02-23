#!/bin/bash

# Installation of i3-gaps
mkdir ~/Downloads/rice

cd ~/Downloads/rice
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake


git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install

sudo pip3 install meson

cd ~/Downloads/rice

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install

# Installation of Rofi
cd ~/Downloads/rice
git clone https://github.com/davatorium/rofi.git
cd rofi
make
sudo make install

#Installation of picom

cd ~/Downloads/rice

sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev \
        libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev \
        libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev \
        libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev \
        libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev \
        libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev

git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install

# Installation of Dunst

cd ~/Downloads/rice

sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev \
        libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev \
        libxdg-basedir-dev libnotify-dev

git clone https://github.com/dunst-project/dunst.git
cd dunst
make
sudo make install

# All the dot files

cd ~/Downloads/rice
git clone https://github.com/k-vernooy/dotfiles.git
cd ~/Downloads/rice/dotfiles
sudo chmod a+rx install.sh
./install.sh

