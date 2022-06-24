#!/bin/bash

cd ~
mkdir -p ~/.vim/pack/plugins/start

git clone git@github.com:tomasr/molokai.git
mv ~/molokai/colors ~/.vim/
rm -rf ~/molokai

git clone git@github.com:itchyny/lightline.vim
mv ~/lightline.vim ~/.vim/pack/plugins/start
rm -rf ~/lightline.vim


git clone git@github.com:preservim/nerdtree.git
mv ~/nerdtree ~/.vim/pack/plugins/start
rm -rf ~/nerdtree

git clone git@github.com:tpope/vim-commentary.git
mv ~/vim-commentary ~/.vim/pack/plugins/start
rm -rf ~/vim-commentary

git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"
