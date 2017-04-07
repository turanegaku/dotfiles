# First file permission
umask 022
# delete all key bind
bindkey -d


export PATH=/usr/local/bin:$PATH

# anyenv
if [[ -f ~/.anyenv/bin/anyenv ]]; then
  export PATH=$PATH:$HOME/.anyenv/bin
  eval "$(anyenv init - -no-rehash)"
fi

# zplug
if [[ -f ~/.zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE=${HOME}/.zsh/zplug.zsh
  source ~/.zplug/init.zsh

  # if ! zplug check --verbose; then
  #   printf "Install? [y/N]: "
  #   if read -q; then
  #     echo; zplug install
  #   else
  #     echo
  #   fi
  # fi

  # zplug load --verbose
  zplug load
fi

if ! has compinit; then
  autoload -U compinit; compinit -u
fi
autoload -Uz colors; colors

# History
# History file
export HISTFILE=${HOME}/.zsh_history
# History size of memory
export HISTSIZE=10000
# History size of file
export SAVEHIST=1000000

zstyle ':completion:*' use-cache true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %P Lines: %m
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:approximate:*' max-errors 1
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%}'
zstyle ':completion:*:default' menu select auto
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
zstyle ':completion:::::' completer _complete _approximate

# Configuration
#
limit coredumpsize 102400

fpath=(~/.zsh/Completion $fpath)
