git clone --depth 1 https://github.com/junegunn/fzf.git ~/.dotfiles/.fzf
~/.dotfiles/.fzf/install
rm -rf ~/.dotfiles/.fzf/.git

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/zsh-autosuggestions
rm -rf ~/.dotfiles/zsh-autosuggestions/.git

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/zsh-syntax-highlighting
rm -rf ~/.dotfiles/zsh-syntax-highlighting.git/.git

sudo apt install bat

echo "Set gnome terminal to use zsh"
chsh -s $(which zsh)

echo "run source ~/.dotfiles/.zshrc >> ~/.zshrc"