rm -rf ~/.bashrc
ln -s ~/dotfiles/bashrc ~/.bashrc

sudo rm -rf /etc/inputrc
sudo ln -s ~/dotfiles/inputrc /etc/inputrc

sudo rm -rf ~/.bash_aliases
ln -s ~/dotfiles/bash_aliases ~/.bash_aliases

pip3 install neovim
rm -rf ~/.vimrc
ln -s ~/dotfiles/vimrc ~/.vimrc

rm -rf ~/.vim
mkdir -p ~/.vim/pack/plugins/start

cd
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
bash ~/installer.sh ~/.cache/dein
rm -rf ~/installer.sh

git clone git@github.com:tomasr/molokai.git
mv ~/molokai/colors .vim/
rm -rf ~/molokai

git clone git@github.com:itchyny/lightline.vim
mv ~/lightline.vim ~/.vim/pack/plugins/start

git clone git@github.com:preservim/nerdtree.git
mv ~/nerdtree ~/.vim/pack/plugins/start

git clone git@github.com:tpope/vim-commentary.git
mv ~/vim-commentary ~/.vim/pack/plugins/start

git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"

ln -s ~/dotfiles/powerline-shell ~/.config/powerline-shell

