# Prompt
#

setopt prompt_subst

typeset -A emoji
emoji[connect]=$'\U1F50C'

# __git_files() { _files }
# autoload -Uz add-zsh-hook
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git svn hg bzr
# zstyle ':vcs_info:*' formats '(%s)-[%b]'
# zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
# zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
# zstyle ':vcs_info:bzr:*' use-simple true
# autoload -Uz is-at-least
# if is-at-least 4.3.10; then
#   zstyle ':vcs_info:git:*' check-for-changes true
#   zstyle ':vcs_info:git:*' stagedstr "^"
#   zstyle ':vcs_info:git:*' unstagedstr "*"
#   zstyle ':vcs_info:git:*' formats 'on %s:%b %c%u '
#   zstyle ':vcs_info:git:*' actionformats '%s:%b|%a %c%u'
# fi
# function _update_vcs_info_msg() {
#   psvar=()
#   LANG=en_US.UTF-8 vcs_info
#   [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
# }
# add-zsh-hook precmd _update_vcs_info_msg

autoload -Uz add-zsh-hook
function _vcs_git_indicator () {
  local -A emoji
  emoji[git]=$'\U1F500'
  emoji[git_changed]=$'\U2744'
  emoji[git_untracked]=$'\U2601'
  emoji[git_clean]=$'\U2728'

  local -A git_info
  local git_indicator git_status
  git_status=("${(f)$(git status --porcelain --branch 2> /dev/null)}")
  (( $? == 0 )) && {
    git_info[branch]="${${git_status[1]}#\#\# }"
    shift git_status
    git_info[changed]=${#git_status:#\?\?*}
    git_info[untracked]=$(( $#git_status - ${git_info[changed]} ))
    git_info[clean]=$(( $#git_status == 0 ))

    git_indicator=("%{%F{white}%}${git_info[branch]}%{%f%}")
    (( ${git_info[clean]}     )) && git_indicator+=("${emoji[git_clean]}")
    (( ${git_info[changed]}   )) && git_indicator+=("${emoji[git_changed]}  %{%F{yellow}%}${git_info[changed]} changed%{%f%}")
    (( ${git_info[untracked]} )) && git_indicator+=("${emoji[git_untracked]}  %{%F{red}%}${git_info[untracked]} untracked%{%f%}")
  }
  _vcs_git_indicator="${git_indicator}"
}

add-zsh-hook precmd _vcs_git_indicator

local nl=$'\n'
local bold="%{$terminfo[bold]%}"
local mark="%{$fg[blue]%}#"
local dir="%{$fg[yellow]%}%~"
local user="%{$fg[cyan]%}%n"
local host="%{$fg[green]%}%m"
[ "$SSH_CLIENT" ] && host+="$emoji[connect]"
local git='$_vcs_git_indicator'
local now="%{$fg[white]%}[%*]"
local st=$'%{%(?.$fg[green].$fg[red])%}%%'
local reset="%{$reset_color%}"

PROMPT="$nl$bold$mark $dir $user $host $now$nl$st $reset"
RPROMPT="$git"

# PROMPT="
# %{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
# %{$terminfo[bold]$fg[yellow]%}%~ \
# %{$fg[cyan]%}%n \
# %{$fg[white]%}at \
# %{$fg[green]%}%m \
# %{$fg[white]%}%1(v|%1v%f|)%{$reset_color%}\
# %{$fg[white]%}[%*]
# %{$terminfo[bold]$fg[red]%}$ %{$reset_color%}%(?.foo.bar)"
