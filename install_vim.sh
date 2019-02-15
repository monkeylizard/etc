#! /bin/bash

cd ~
mkdir .vim
touch .vimrc

git clone https://github.com/vim/vim.git
cd vim

PATH=$PATH:$(pwd)/src

./configure --with-features=huge --prefix=$HOME/.vim

make VIMRUNTIMEDIR=$HOME

