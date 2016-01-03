#!/bin/sh

DOT_FILES=(.gitconfig .tmux.conf .vimperatorrc .vimrc .zshrc .uncrustifyconfig .vrapperrc)

for file in ${DOT_FILES[@]}; do
  if [[ -e $HOME/$file ]]; then pmd5=`md5 -q $HOME/$file`; fi
  if [[ -e $HOME/dotfiles/$file ]]; then md5=`md5 -q $HOME/dotfiles/$file`; fi
  if [[ $pmd5 != $md5 ]]; then
    ln -is "$HOME/dotfiles/$file" $HOME
  fi
done
echo "work done!"
