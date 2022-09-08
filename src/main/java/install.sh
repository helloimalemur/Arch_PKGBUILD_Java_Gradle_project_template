#!/bin/bash
##removes if already installed
sudo systemctl reload-daemon
sudo systemctl stop example
##if configs already exist back them up to ~/.example
mkdir ~/.example
cp /usr/share/example/example.* ~/.example/
##removing
sudo pacman -R example-package --noconfirm # set in PKGBUILD
##reinstalling
rm -rf ~/example/
cd ~
git clone https://github.com/helloimalemur/example
cd example/
./gradlew build
cd ~/example/src/main/java/
makepkg -si --noconfirm
sudo systemctl stop example
##if configs had already exist they should be in home dir already
cd ~
sudo cp ~/.example/* /usr/share/example/
sudo chmod 755 /usr/share/example/*
sudo systemctl reload-daemon
sudo systemctl start example
sudo systemctl status example

