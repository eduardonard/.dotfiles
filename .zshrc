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
source ~/.dotfiles/zsh-ext/fzf-git.sh


cd() {
    builtin cd "$@" && ls -a
}

echo "\033[1;33m🍋 ZestyZsh activated! 🍋\033[0m"