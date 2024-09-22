echo "Loading .zshrc"
source ~/.dotfiles/.env

for file in ~/.dotfiles/zsh-ext/*; do
    if [[ -f "$file" && -r "$file" ]]; then
        source "$file"
    fi
done


if [ "$env" = "work" ]; then
    for file in ~/.dotfiles/zsh-ext/work/*; do
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
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fuzzyfinder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)


# PROMPT
setopt prompt_subst
PS1='%F{yellow}_/%F{blue}%2~ $(git_branch_name)'
autoload -U promptinit
promptinit
