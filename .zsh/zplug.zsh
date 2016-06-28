zplug "~/.zsh", from:local, use:"<->0_*.zsh"
zplug "~/.zsh", from:local, use:"<->5_*.zsh", nice:15

zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/zsh-gomi", as:command, use:bin/gomi
zplug "peco/peco", as:command, from:gh-r, frozen:1
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf", frozen:1

zplug "~/bin", from:local, as:command, use:run.sh, rename-to:"rpp"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:19
