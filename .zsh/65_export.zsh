if has 'go'; then
  export GOPATH=${HOME}/go
  export PATH=$PATH:$GOPATH/bin
  source ~/dotfiles/golang.plugin.zsh
fi

if [[ -f ~/.anyenv/bin/anyenv ]]; then
  export PATH=$PATH:$HOME/.anyenv/bin
  eval "$(anyenv init -)"
fi
