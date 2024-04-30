#!/bin/bash

# dependencies
echo "Installing dependencies"
sudo pacman -Sy xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk gd font-symbola libXft-bgra picom alacritty firefox ttf-jetbrains-mono nnn

# base configurations
echo "Creating directories"
mkdir /home/hayden/.config
mkdir /home/hayden/.local/bin

echo "Cloning suckless applications"
cd /home/hayden/.config/
for app in dwm dmenu slstatus st; do
	git clone "https://git.suckless.org/$app"
	cd "$app"
	make
	sudo make clean install
	cd ..
done

# startup
cp /etc/X11/xinit/xinitrc /home/hayden/.xinitrc
