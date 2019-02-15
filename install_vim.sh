#! /bin/bash

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --prefix=$HOME

make VIMRUNTIMEDIR=$HOME
