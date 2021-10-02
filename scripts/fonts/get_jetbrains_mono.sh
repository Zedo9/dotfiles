#!/bin/sh
# Install Jetbrains mono
sudo wget https://download.jetbrains.com/fonts/JetBrainsMono-2.225.zip
sudo unzip JetBrainsMono-2.225.zip
sudo mv fonts/ttf/* /usr/share/fonts/truetype/jetbrains-mono/
sudo fc-cache -fv
sudo rm -rf JetBrainsMono-2.225.zip OFL.txt AUTHORS.txt fonts