#!/bin/sh

curl -sL get.zplug.sh | zsh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein
rm ./installer.sh
vim +':call dein#install()'
