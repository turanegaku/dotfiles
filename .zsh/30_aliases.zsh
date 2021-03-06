# Common
alias l='ls -lah'
alias la='ls -lAh'
alias ld='ls -ld'
alias ll='ls -lh'
alias ls='ls -G'

alias g++11='g++ -std=c++11'
alias ti=tig
alias vi=vim
alias v=vim
alias c=cat
alias py=python
alias ipy=ipython

if has 'tmux'; then
  alias t=tmux
  alias ta='t a -t'
fi

if has 'rlwrap'; then
  alias gosh='rlwrap gosh'
fi

alias grep='grep --color'
alias pgrep='ps aux | grep -v grep | grep'

# if [[ -f /bin/zsh ]]; then
#   has 'gomi' && alias rm='gomi'
# fi

# Git
if has 'git'; then
  alias g=git
  alias ga='g add'
  alias gn='g branch'
  alias gm='g commit'
  alias gmm='gm -m'
  alias gme='gmm "" --allow-empty-message'
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
  alias gf="g merge --ff-only"
  # alias -g LR='`git branch -a | peco --query "remotes/ " --prompt "GIT REMOTE BRANCH>" | head -n 1 | sed "s/^\*\s*//" | sed "s/remotes\/[^\/]*\/\(\S*\)/\1 \0/"`'
fi

# Global
if [[ $0 =~ .*"zsh" ]]; then
  alias -g L='| less'
  alias -g G='| grep'
  alias -g H='| head'
  alias -g T='| tail'
  alias -g S='| sort'
  alias -g N=' >/dev/null 2>&1'
  alias -g N1=' >/dev/null'
  alias -g N2=' 2>/dev/null'
fi
