# Vim-like keybind as default
bindkey -v

# Vim-like escapint jk keybind
bindkey -M viins 'jk'     vi-cmd-mode

# Add emacs-like key bind to biins mode
bindkey -M viins '^F'     forward-char
bindkey -M viins '^B'     backward-char
bindkey -M viins '^A'     beginning-of-line
bindkey -M viins '^E'     end-of-line
bindkey -M viins '^P'     history-beginning-search-backward
bindkey -M viins '^N'     history-beginning-search-forward
bindkey -M viins '^H'     backward-delete-char
bindkey -M viins '^D'     delete-char-or-list
bindkey -M viins '^W'     backward-kill-ward
bindkey -M viins '^K'     kill-line
bindkey -M viins '^U'     kill-whole-line
bindkey -M viins '^Y'     yank

bindkey -M vicmd '^A'     beginning-of-line
bindkey -M vicmd '^E'     end-of-line
bindkey -M vicmd '^P'     history-beginning-search-backward
bindkey -M vicmd '^N'     history-beginning-search-forward
bindkey -M vicmd '^K'     kill-line
bindkey -M vicmd '^U'     kill-whole-line
bindkey -M vicmd '^Y'     yank
bindkey -M vicmd 'j'      undefined-key
bindkey -M vicmd 'k'      undefined-key

# Ctrl-R
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER zle reset-prompt
}
zle -N peco-history-selection
bindkey -M viins '^R' peco-history-selection
bindkey -M vicmd '^R' peco-history-selection
