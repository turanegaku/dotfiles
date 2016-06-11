export PATH=/usr/local/bin:$PATH

source ~/.zplug/zplug

zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug load

autoload -U compinit
compinit -u
autoload -Uz colors ; colors
autoload -Uz history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
HISTFILE=${HOME}/.zsh-history
HISTSIZE=10000000
SAVEHIST=100000

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

# Aliases
#
alias -g L='| less'
alias -g G='| grep'
alias -g LR='`git branch -a | peco --query "remotes/ " --prompt "GIT REMOTE BRANCH>" | head -n 1 | sed "s/^\*\s*//" | sed "s/remotes\/[^\/]*\/\(\S*\)/\1 \0/"`'
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias grep='grep --color'
alias t=tmux
alias ta='t a -t'
alias v=vi
alias ti=tig
alias g++11='g++ -std=c++11'
alias g=git
alias ga='g add'
alias gn='g branch'
alias gm='g commit'
alias gm='gm -m'
alias gma='gm --amend'
alias gc='g checkout'
alias gb='gc -b'
alias gcm='gc master'
alias g.='gc -- .'
alias gd='g diff --color-words'
alias gdc='gd --cached'
alias gs='g status'
alias gl="g lg -n 10"
alias gll="g lg"
alias gp="g push"
alias gg="g merge --no-ff"
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER zle reset-prompt 
}
zle -N peco-history-selection 
bindkey '^R' peco-history-selection
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Configuration
#
limit coredumpsize 102400
setopt prompt_subst
setopt nobeep
setopt long_list_jobs
setopt list_types
setopt auto_resume
setopt auto_list
setopt hist_ignore_dups
setopt autopushd
setopt pushd_ignore_dups
setopt extended_glob
setopt auto_menu
setopt extended_history
setopt equals
setopt magic_equal_subst
setopt hist_verify
setopt numeric_glob_sort
setopt print_eight_bit
setopt share_history
setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt correct
setopt noautoremoveslash
setopt complete_aliases
setopt glob_complete
setopt no_complete_aliases

# Prompt
#
__git_files() { _files }
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "^"
  zstyle ':vcs_info:git:*' unstagedstr "*"
  zstyle ':vcs_info:git:*' formats 'on %s:%b %c%u '
  zstyle ':vcs_info:git:*' actionformats '%s:%b|%a %c%u'
fi
function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$terminfo[bold]$fg[yellow]%}%~ \
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}%m \
%{$fg[white]%}%1(v|%1v%f|)%{$reset_color%}\
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

# Paths
#
if [ -x "`which go`" ]; then
  export GOPATH="$HOME/go"
  export PATH=$PATH:$GOPATH/bin
  source ~/dotfiles/golang.plugin.zsh
fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
