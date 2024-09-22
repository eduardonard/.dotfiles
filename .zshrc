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

source ~/.dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.dotfiles/zsh-ext/fzf-git.sh


cd() {
    builtin cd "$@" && paste <(ls -d * | sort) <(ls -d .?* | sort) | column -t
}

echo "🍋"