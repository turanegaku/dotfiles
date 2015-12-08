#!/bin/sh

DOT_FILES=(.gitconfig .tmux.conf .vimperatorrc .vimrc .zshrc .uncrustifyconfig)

for file in ${DOT_FILES[@]}; do
  if [[ `md5 -q $HOME/$file` != `md5 -q $HOME/dotfiles/$file` ]]; then
    ln -is "$HOME/dotfiles/$file" $HOME
  fi
done
echo "work done!"
