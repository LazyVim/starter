#!/bin/bash

sudo apt-get install ripgrep

# setup font
sudo cp .font/*.ttf /usr/share/fonts/truetype/
sudo fc-cache -f -v

# setup vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
