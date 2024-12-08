#! /bin/sh

# PROMPT
setopt prompt_subst
PS1='
%F{green}$(date +"%H:%M:%S")
%F{cyan}%~  $(git_branch_name)
'