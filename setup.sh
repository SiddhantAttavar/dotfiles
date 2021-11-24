#!/bin/bash

# Initialize dotfilesDir
dotfilesDir="$HOME/.dotfiles"

# Helper functions for creating symlinks
function createSymlink {
  curr="${dotfilesDir}/${1}"
  dest="$HOME/${2}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h "${dest}" ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${curr} ${dest}
}

# Install programs
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt install -y neovim
sudo apt install -y neofetch

# Create folders for conf files
mkdir -p $HOME/.config

# Create symlinks
# createSymlink foo bar
createSymlink bash/.bashrc .bashrc
createSymlink bash/.hushlogin .hushlogin
createSymlink nvim .config/nvim
createSymlink neofetch .config/neofetch

# Setup neovim: install vim-plug and plugins
echo "Installing Neovim plugins"
nvim --headless +PlugInstall +qa > /dev/null
