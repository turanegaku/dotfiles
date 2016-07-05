# Emacs-like keybind as default
bindkey -e

# History search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Ctrl-R
function peco-history-selection() {
  BUFFER=`history 1 | sort -nr | perl -nle 's/^\s*\d+.?\s+//; print' | awk '!x[$0]++' | fzf --reverse +s`
  CURSOR=$#BUFFER zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
