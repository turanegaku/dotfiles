# ommit cd
setopt auto_cd
# fix typo
setopt correct
# {a-c} -> a b c
setopt brace_ccl
# enable 8bit
setopt print_eight_bit
# if a ='a b c' $a -> 'a b c', '$a' -> [a, b, c]
setopt sh_word_split
# when push space not to remove slash
setopt no_auto_remove_slash
# no beep
setopt no_beep
setopt no_list_beep
setopt no_hist_beep
# expand '=command' as path of command
setopt equals
# ?
setopt auto_resume
# complete alias
setopt complete_aliases

setopt extended_glob
setopt extended_history
setopt glob_complete
setopt hist_ignore_dups
setopt hist_verify
setopt list_types
setopt long_list_jobs
setopt magic_equal_subst
setopt no_complete_aliases
setopt numeric_glob_sort
setopt prompt_subst
setopt share_history
