if has 'go'; then
  export GOPATH=${HOME}/go
  export PATH=$PATH:$GOPATH/bin
  source ~/dotfiles/golang.plugin.zsh
fi
