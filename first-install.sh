sudo apt install git
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

git clone https://github.com/eduardonard/.dotfiles

touch ~/.dotfiles/.env
echo "env=personal" >> ~/.dotfiles/.env 

~/.dotfiles/.fzf/install

echo "Set gnome terminal to use zsh"
touch ~/.zshrc
echo "source ./.dotfiles/.zshrc