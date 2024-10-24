# ! bin/sh

# PROMPT
setopt prompt_subst
PS1='
%F{cyan}%~  $(git_branch_name)
'
RPROMPT='%F{green}$(date +"%H:%M:%S") %F{yellow}$(if [[ $? -ne 0 ]]; then echo "✖"; else echo "✔"; fi)%f'

autoload -U promptinit
promptinit