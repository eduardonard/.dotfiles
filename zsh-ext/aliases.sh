#! /bin/sh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

if [ "$env" = "personal" ]; then
  alias brightness="brightnessctl -d 'intel_backlight' set "
  alias settings="gnome-control-center"
fi

alias update-all='sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt -y autoclean'
alias off='update-all && shutdown'
alias l="paste <(ls -d *  | sort) <(ls -d .?* | sort) | column -t"
alias lsla="ls -la"

# Git
alias g="git"
alias glook="git log --graph --oneline --decorate --abbrev-commit --boundary HEAD origin/main"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit"
alias gcm="git commit -m"
alias gac="git add . && git commit -m"
alias gd="git diff"
alias gds="git diff --staged"
alias gstaash="git stash -u"
