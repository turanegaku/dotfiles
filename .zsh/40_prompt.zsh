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

# to bold
PROMPT="%{$terminfo[bold]%}
" # mark #
PROMPT+="%{$fg[blue]%}# "
# now dir
PROMPT+="%{$fg[yellow]%}%~ "
# user name
PROMPT+="%{$fg[cyan]%}%n "
# host name
PROMPT+="%{$fg[green]%}%m "
# git status
PROMPT+="%{$fg[white]%}%1(v|%1v%f|)"
# time
PROMPT+="%{$fg[white]%}[%*]
"
# finish status
PROMPT+="%{%(?.$fg[green].$fg[red])%}$ "
# reset color
PROMPT+="%{$reset_color%}"

# PROMPT="
# %{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
# %{$terminfo[bold]$fg[yellow]%}%~ \
# %{$fg[cyan]%}%n \
# %{$fg[white]%}at \
# %{$fg[green]%}%m \
# %{$fg[white]%}%1(v|%1v%f|)%{$reset_color%}\
# %{$fg[white]%}[%*]
# %{$terminfo[bold]$fg[red]%}$ %{$reset_color%}%(?.foo.bar)"
