echo "Loading .zshrc"

mode="work"

for file in ~/.dotfiles/zsh-extensions/*; do
    if [[ -f "$file" && -r "$file" ]]; then
        source "$file"
    fi
done


if [ "$mode" = "work" ]; then
    for file in ~/.dotfiles/zsh-extensions/work/*; do
        if [[ -f "$file" && -r "$file" ]]; then
            source "$file"
        fi
    done

    export PATH="/opt/homebrew/bin:$PATH"
    export DOCKER_HOST=unix:///$HOME/.colima/docker.sock
fi

ZSH_THEME="robbyrussell"

plugins=(git)

source ~/.dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fuzzyfinder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)


# PROMPT
setopt prompt_subst
PS1='%F{yellow}_/%F{blue}%2~ $(git_branch_name)'
autoload -U promptinit
promptinit



