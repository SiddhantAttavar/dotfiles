#!/bin/bash

# Initialize dotfilesDir
DOTFILES_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Helper functions for creating symlinks
function createSymlink {
	CURR="$DOTFILES_DIR/${1}"
	DEST="$HOME/${2}"
	DATE_STR=$(date +%Y-%m-%d-%H%M)

	if [ -h "${DEST}" ]; then
		# Existing symlink 
		echo "Removing existing symlink: ${DEST}"
		rm ${DEST} 

	elif [ -f "${DEST}" ]; then
		# Existing file
		echo "Backing up existing file: ${DEST}"
		mv ${DEST}{,.${DATE_STR}}

	elif [ -d "${DEST}" ]; then
		# Existing dir
		echo "Backing up existing dir: ${DEST}"
		mv ${DEST}{,.${DATE_STR}}
	fi

	echo "Creating new symlink: ${DEST}"
	ln -s ${CURR} ${DEST}
}

# Install programs
# Add repositories
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

# Install programs
echo "Installing programs"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt install -y neovim
sudo apt install -y tmux
sudo apt install -y neofetch
sudo apt install -y codium

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
. ~/.fzf/install

# Create folders for conf files
mkdir -p $HOME/.config

# Create symlinks
# createSymlink foo bar
echo "Creating symlinks"
createSymlink bash/.bashrc .bashrc
createSymlink bash/.bash_aliases .bash_aliases
createSymlink bash/.hushlogin .hushlogin
createSymlink bash/.dircolors .dircolors
createSymlink vale/.vale.ini .vale.ini
createSymlink nvim .config/nvim
createSymlink vim .vim
createSymlink vscodium .config/VSCodium
createSymlink neofetch .config/neofetch
createSymlink x/.xmodmap .xmodmap
createSymlink scripts .scripts

# Setup neovim: install vim-plug and plugins
curl -fLo ~/.vim/autoload/plug.vim --createdirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Installing Neovim plugins"
nvim --headless +PlugInstall +qa 2> /dev/null

# Source config files
echo "Sourcing config files"
source ~/.bashrc
