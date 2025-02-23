#! /bin/sh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

if [ "$env" = "personal" ]; then
  alias pair-buds="bluetoothctl connect 6C:D3:EE:64:F8:F0"
  alias brightness="brightnessctl -d 'intel_backlight' set "
  alias battery="upower -i $(upower -e | grep 'BAT') | grep -E 'state|to\ full|percentage'"
  alias volume="amixer set Master "
  alias settings="gnome-control-center"
  alias restart-audio="pulseaudio -k && alsa force-reload"
fi

alias update-all='sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt -y autoclean'
alias off='update-all && shutdown'
alias bat="batcat"
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
