#! /bin/sh

DOT_FILES=(.gitconfig .tmux.conf .vimperatorrc .vimrc .zshrc)

for file in ${DOT_FILES[@]}; do
  ln -is "$HOME/dotfiles/$file" $HOME
done
