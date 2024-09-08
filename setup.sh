#!/bin/bash

sudo apt-get install ripgrep

mkdir -p ~/.local/share/fonts
cp .font/{*.ttf,*.otf} ~/.local/share/fonts
sudo cp *.ttf /usr/share/fonts/truetype/
sudo fc-cache -f -v
