#! /bin/sh

# PROMPT
setopt prompt_subst
PS1='
%F{cyan}%~  $(git_branch_name)
'