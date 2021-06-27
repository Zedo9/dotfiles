#!/bin/sh

sudo mkdir firicico 
sudo mkdir /usr/share/fonts/truetype/pacifico/
sudo wget https://github.com/kosimst/Firicico/raw/master/Firicico%20Italic.ttf -P ./firicico
sudo wget https://github.com/kosimst/Firicico/raw/master/Firicico.ttf -P ./firicico
sudo wget https://www.fontsquirrel.com/fonts/download/pacifico

unzip pacifico

sudo mv firicico /usr/share/fonts/truetype/firicico
sudo mv Pacifico.ttf /usr/share/fonts/truetype/pacifico/
sudo fc-cache -fv

rm -rf pacifico 'SIL Open Font License.txt' firicico