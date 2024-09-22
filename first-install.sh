sudo apt install i3
sudo apt install vim
sudo apt install gh
sudo apt install feh
sudo apt -f install gnome-terminal
sudo apt install zsh

sudo snap install code --classic
sudo snap install nvim --classic

snap install discord
snap install firefox
snap install notion-snap-reborn
snap install notion-calendar-snap
snap install spotify
snap install whatsapp-for-linux

gh login


git clone --depth 1 https://github.com/junegunn/fzf.git ~/.dotfiles/.fzf
~/.dotfiles/.fzf/install
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/zsh-syntax-highlighting.git

echo "Set gnome terminal to use zsh"
touch ~/.zshrc
echo "source ./.dotfiles/.zshrc