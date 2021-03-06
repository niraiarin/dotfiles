setopt pushd_minus
setopt pushd_ignore_dups
setopt pushd_to_home
setopt correct
setopt correct_all
setopt no_clobber
setopt brace_ccl
setopt print_eight_bit
setopt sh_word_split
setopt rc_quotes
setopt multios
setopt auto_remove_slash
setopt no_beep
setopt no_list_beep
setopt no_hist_beep
setopt equals
setopt no_flow_control
setopt path_dirs
setopt print_exit_value
#setopt xtrace
setopt rm_star_wait
setopt notify
setopt long_list_jobs
setopt auto_resume
#setopt ignore_eof
setopt no_case_glob
setopt extended_glob
setopt mark_dirs

# Automaticall escape URL when copy and paste
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

setopt no_prompt_cr
setopt mail_warning
setopt hist_ignore_dups
setopt hist_save_nodups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt share_history
setopt hist_reduce_blanks
setopt inc_append_history
setopt hist_no_store
setopt hist_no_functions
setopt extended_history
setopt hist_ignore_space
setopt append_history
setopt hist_verify
setopt bang_hist
setopt always_last_prompt
setopt auto_cd
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt complete_in_word
setopt globdots
setopt interactive_comments
setopt list_types
setopt magic_equal_subst
