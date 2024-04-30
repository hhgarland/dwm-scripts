#!/bin/bash

echo "Installing dependencies"
sudo pacman -Sy xorg-server xorg-xinit libx11 libxinerama libxft webkit2gtk gd font-symbola libXft-bgra picom alacritty firefox

echo "Creating and clone directories"
mkdir /home/hayden/.config
mkdir /home/hayden/.local/bin

for app in dwm dmenu slstatus st; do
	git clone "https://git.suckless.org/$app"
	cd "$app"
	make
	sudo make clean install
	cd ..
done
