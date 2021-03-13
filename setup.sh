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

ln -s ~/dotfiles/powerline-shell ~/.config/powerline-shell

