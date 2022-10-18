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

# Termux setup
termux-setup-storage
pkg install coreutils
pkg update
pkg upgrade

# Install programs
echo "Installing programs"
pkg install -y neovim
pkg install -y tmux
pkg install -y neofetch
pjg install -y fzf
pkg install -y python

# Create folders for conf files
mkdir -p $HOME/.config
mkdir -p $HOME/bin

# Create symlinks
# createSymlink foo bar
echo "Creating symlinks"
createSymlink rc/.shrc .shrc
createSymlink rc/.sh-aliases .sh-aliases
createSymlink rc/.hushlogin .hushlogin
createSymlink rc/.dircolors .dircolors
createSymlink rc/.inputrc .inputrc
createSymlink bash/.bashrc .bashrc
createSymlink zsh/.zshrc .zshrc
createSymlink vale/.vale.ini .vale.ini
createSymlink nvim .config/nvim
createSymlink ranger .config/ranger
createSymlink vscodium .config/VSCodium
createSymlink neofetch .config/neofetch
createSymlink termux .termux
createSymlink scripts .scripts

if [ ! -f $HOME/bin/termux-file-editor ]; then
	ln -s $PREFIX/bin/nvim $HOME/bin/termux-file-editor
fi

# Setup neovim: install vim-plug and plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Installing Neovim plugins"
nvim --headless +PlugInstall +qa 2> /dev/null

# Oh-my-zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s zsh

# Source config files
echo "Sourcing config files"
source $HOME/.shrc
