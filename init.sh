#!/bin/sh

if [[ ! -d ~/.zplug ]]; then
  echo 'ok'
  curl -sL get.zplug.sh | zsh
fi
if [[ ! -d ~/.vim/dein ]]; then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  sh ./installer.sh ~/.vim/dein
  rm ./installer.sh
  vim +':call dein#install()' +':q'
fi
