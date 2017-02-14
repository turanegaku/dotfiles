zplug "~/.zsh", from:local, use:"<->0_*.zsh"
zplug "~/.zsh", from:local, use:"<->5_*.zsh", defer:2

zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi
zplug "peco/peco", as:command, from:gh-r, frozen:1
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", frozen:1

zplug "motemen/ghq", as:command, from:gh-r, rename-to:ghq, frozen:1

zplug "~/bin", from:local, as:command, use:rpp.sh, rename-to:"rpp"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "yyuu/pyenv-virtualenv", dir:"~/.anyenv/envs/pyenv/plugins/pyenv-virtualenv", if:"which pyenv"
zplug "tmux-plugins/tpm", dir:"~/.tmux/plugins/tpm", if:"which tmux"
