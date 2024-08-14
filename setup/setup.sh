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
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:aslatter/ppa
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list

# Install programs
echo "Installing programs"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -y zsh
sudo apt install -y neovim
sudo apt install -y tmux
sudo apt install -y neofetch
sudo apt install -y codium
sudo apt install -y fzf
sudo apt install -y fd-find
sudo apt install -y bat
sudo apt install -y pass
sudo apt install -y neomutt
sudo apt install -y gnupg
sudo apt install -y zathura
sudo apt install -y qutebrowser
sudo apt install -y alacritty
sudo apt install -y htop
sudo apt install -y libpam-fprintd
sudo apt install -y python3-pip
sudo apt install -y cloudflare-warp

pip install ranger-fm

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install tealdeer
cargo install rm-improved
cargo install spotify-tui
cargo install spotifyd --locked
cargo install --git https://github.com/boxdot/gurk-rs gurk

# Update tldr cache
export PATH="$HOME/.cargo/bin:$PATH"
tldr --update

# Create folders for conf files
mkdir -p $HOME/.config

# Create symlinks
# createSymlink foo bar
echo "Creating symlinks"
createSymlink rc/.shrc .shrc
createSymlink rc/.sh-aliases .sh-aliases
createSymlink rc/.hushlogin .hushlogin
createSymlink rc/.dircolors .dircolors
createSymlink rc/.inputrc .inputrc
createSymlink rc/.xprofile .xprofile
createSymlink bash/.bashrc .bashrc
createSymlink zsh/.zshrc .zshrc
createSymlink neofetch .config/neofetch
createSymlink nvim .config/nvim
createSymlink vim .vim
createSymlink vale/.vale.ini .vale.ini
createSymlink ranger .config/ranger
createSymlink alacritty .config/alacritty
createSymlink vscodium .config/VSCodium
createSymlink x/.xmodmap .xmodmap
createSymlink desktop/firefox-private.desktop .local/share/applications/firefox-private.desktop
createSymlink desktop/openvibe-desktop.desktop .local/share/applications/openvibe-desktop.desktop
createSymlink desktop/arduino.desktop .local/share/applications/arduino.desktop
createSymlink scripts .scripts
createSymlink pistol .config/pistol
createSymlink bat .config/bat
createSymlink browser/qutebrowser .config/qutebrowser
createSymlink browser/userscripts .local/share/qutebrowser/greasemonkey
createSymlink git .config/git
createSymlink tmux/.tmux.conf .tmux.conf
createSymlink spotify-tui .config/spotify-tui
createSymlink spotifyd .config/spotifyd
createSymlink zathura .config/zathura
createSymlink pop-launcher .local/share/pop-launcher
createSymlink mutt .mutt
createSymlink pulse .config/pulse

# Install vscodium extensions
codium --install-extension DivyanshuAgrawal.competitive-programming-helper
codium --install-extension formulahendry.code-runner
codium --install-extension yzhang.markdown-all-in-one
codium --install-extension cweijan.vscode-office
codium --install-extension asvetliakov.vscode-neovim

# Oh-my-zsh setup
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
mkdir -p ~/.local/bin
wget -O ~/.local/bin/pistol https://github.com/doronbehar/pistol/releases/latest/download/pistol

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Source config files
echo "Sourcing config files"
source $HOME/.shrc

fprint-enroll
