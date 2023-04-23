# dotfiles
My personal configuration for Windows, Linux and Android

## Setup
### Windows
 - Clone this repository: `git clone https://github.com/SiddhantAttavar/dotfiles.git`
 - cd into the dotfiles directory: `cd dotfiles`
 - Run `setup.ps1` in PowerShell as an administrator with the command: `powershell -ExecutionPolicy Bypass -File setup.ps1`

### Linux / WSL
 - Clone this repository: `git clone https://github.com/SiddhantAttavar/dotfiles.git ~/.dotfiles`
 - cd into the dotfiles-windows directory: `cd ~/.dotfiles`
 - Run `setup.sh` in bash as an administrator with the command: `bash setup.sh`

### Android / Termux
 - Clone this repository: `git clone https://github.com/SiddhantAttavar/dotfiles.git ~/.dotfiles`
 - cd into the dotfiles directory: `cd ~/.dotfiles`
 - Run `termux-setup.sh` in bash as an administrator with the command: `bash termux-setup.sh`

## Programs and other things I use
### IDEs and editors:
 - [Neovim](https://neovim.io/) — Plugins (using [Packer](https://github.com/wbthomason/packer.nvim)):
	- [onedark](https://github.com/navarasu/onedark.nvim)
	- [vim-sensible](https://github.com/tpope/vim-sensible)
	- [fzf](https://github.com/junegunn/fzf.vim)
	- [vim-fugitive](https://github.com/tpope/vim-fugitive)
	- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
	- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
	- [alpha](https://github.com/goolord/alpha-nvim)
	- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
	- [lualine](https://github.com/nvim-lualine/lualine.nvim)
	- [toggleterm](https://github.com/akinsho/toggleterm.nvim)
	- [nvim-notify](https://github.com/rcarriga/nvim-notify)
	- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
	- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
	- [mason](https://github.com/williamboman/mason.nvim)
	- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
	- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
	- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
	- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
	- [Comment](https://github.com/numToStr/Comment.nvim)
	- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
	- [guess-indent](https://github.com/nmac427/guess-indent.nvim)
	- [competitest](https://github.com/xeluxee/competitest.nvim)
	- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
	- [markdowny](https://github.com/antonk52/markdowny.nvim)
	- [vim-markdown](https://github.com/preservim/vim-markdown)
	- [mkdnflow](https://github.com/jakevincent/mkdnflow.nvim)
	- [leap](https://github.com/ggandor/leap.nvim)
	- [which-key](https://github.com/folke/which-key.nvim)
 - [VSCodium](https://vscodium.com) — Extensions:
	- [Competitive Programming Helper](https://marketplace.visualstudio.com/items?itemName=DivyanshuAgrawal.competitive-programming-helper)
	- [Code-Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
	- [Office Viewer](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-office)
	- [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)

### Terminal stuff:
 - [Alacritty](https://alacritty.org/)
 - [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10): Ubuntu 20.04 LTS
 - [Windows Terminal](http://aka.ms/windowsterminal)
 - [Termux](https://f-droid.org/en/packages/com.termux/)
 - [ZSH](https://www.zsh.org/)
 - [Tmux](https://github.com/tmux/tmux)
 - [Ranger](https://github.com/ranger/ranger)
 - [CMus](https://cmus.github.io/)

### General tools:
 - [Qutebrowser](https://qutebrowser.org)
 - [Firefox](https://www.mozilla.org/en-US/firefox/new/) — Extensions:
	- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
	- [BrowserToys](https://github.com/SiddhantAttavar/BrowserToys-Extension)
	- [Competitive Companion](https://addons.mozilla.org/en-US/firefox/addon/competitive-companion/)
	- [LanguageTool](https://addons.mozilla.org/en-US/firefox/addon/languagetool/)
	- [Tridactyl](https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/)
	- [GNOME Shell Integration](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/)
	- [AdNauseam](https://addons.mozilla.org/en-US/firefox/addon/adnauseam/)
	- [Block Site](https://addons.mozilla.org/en-US/firefox/addon/block-website/)
	- [CanvasBlocker](https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/)
	- [Cookie AutoDelete](https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/)
	- [Enhancer for YouTube](https://addons.mozilla.org/en-US/firefox/addon/enhancer-for-youtube/)
	- [PassFF](https://addons.mozilla.org/en-US/firefox/addon/passff/)
	- [Privacy Badger](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger/)
	- [Reddit Enhancement Suite](https://addons.mozilla.org/en-US/firefox/addon/reddit-enhancement-suite/)
	- [Return YouTube Dislike](https://addons.mozilla.org/en-US/firefox/addon/return-youtube-dislikes/)
	- [Simple Translate](https://addons.mozilla.org/en-US/firefox/addon/simple-translate/)
	- [SponsorBlock for YouTube](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
	- [Stylus](https://addons.mozilla.org/en-US/firefox/addon/stylus/)
	- [Tampermonkey](https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/)
 - [Powertoys](https://docs.microsoft.com/en-us/windows/powertoys/)

### Android apps:
