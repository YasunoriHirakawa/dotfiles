#!/bin/bash

# Install some packages and initial setups

mkdir -p ~/.config

if ! which zsh &> /dev/null; then
    sudo apt install zsh
fi
if ! echo $SHELL | grep zsh &> /dev/null; then
    sudo chsh $USER -s $(which zsh)
fi

if ls -l /usr/bin/vim | grep /etc/alternatives/vim.tiny &> /dev/null; then
    sudo apt install vim
fi
mkdir ~/.vim

if ! which nvim &> /dev/null; then
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt update
    sudo apt install neovim
fi
if ! pip list | grep pynvim &> /dev/null; then
    pip install pynvim
fi

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
bash ~/installer.sh ~/.cache/dein
rm -rf ~/installer.sh

# Link setting files

rm -rf ~/.zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc

sudo rm -rf /etc/inputrc
sudo ln -s ~/dotfiles/inputrc /etc/inputrc

rm -rf ~/.bash_aliases
ln -s ~/dotfiles/bash_aliases ~/.bash_aliases

rm -rf ~/.config/nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
rm -rf ~/.vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc

rm -rf ~/.tmux.conf
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# Install and setup powerline-shell

if ! pip list | grep powerline-shell &> /dev/null; then
    pip install powerline-shell
fi
mkdir -p ~/.config/powerline-shell
rm -rf ~/.config/powerline-shell/config.json
ln -s ~/dotfiles/powerline-shell/powerline-shell-config.json ~/.config/powerline-shell/config.json

exit 0

# cd

# git clone git@github.com:tomasr/molokai.git
# mv ~/molokai/colors .vim/
# rm -rf ~/molokai

# git clone git@github.com:itchyny/lightline.vim
# mv ~/lightline.vim ~/.vim/pack/plugins/start

# git clone git@github.com:preservim/nerdtree.git
# mv ~/nerdtree ~/.vim/pack/plugins/start

# git clone git@github.com:tpope/vim-commentary.git
# mv ~/vim-commentary ~/.vim/pack/plugins/start

# git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
# vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"

