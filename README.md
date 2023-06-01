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
 - Install [Termux](https://f-droid.org/en/packages/com.termux/) from [F-Droid](https://f-droid.org/en/packages/org.fdroid.fdroid/)
 - Clone this repository: `git clone https://github.com/SiddhantAttavar/dotfiles.git ~/.dotfiles`
 - cd into the dotfiles directory: `cd ~/.dotfiles`
 - Run `termux-setup.sh` in bash as an administrator with the command: `bash termux-setup.sh`

## Programs and other things I use
### IDEs and editors:
 - [Neovim](https://neovim.io/) — Plugins (using [Lazy](https://github.com/folke/lazy.nvim)):
	- [alpha-nvim](https://github.com/goolord/alpha-nvim)
	- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
	- [competitest.nvim](https://github.com/xeluxee/competitest.nvim)
	- [fzf.vim](https://github.com/junegunn/fzf.vim)
	- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
	- [guess-indent.nvim](https://github.com/nmac427/guess-indent.nvim)
	- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
	- [leap.nvim](https://github.com/ggandor/leap.nvim)
    - [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)
	- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
    - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
	- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
	- [markdowny.nvim](https://github.com/antonk52/markdowny.nvim)
	- [mason.nvim](https://github.com/williamboman/mason.nvim)
	- [mkdnflow.nvim](https://github.com/jakevincent/mkdnflow.nvim)
	- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
	- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
	- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
	- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
	- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
	- [nvim-notify](https://github.com/rcarriga/nvim-notify)
	- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
	- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    - [nvim-ts-rainbow2](https://github.com/HiPhish/nvim-ts-rainbow2)
	- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
	- [onedark.nvim](https://github.com/navarasu/onedark.nvim)
	- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
	- [vim-abolish](https://github.com/tpope/vim-abolish)
	- [vim-endwise](https://github.com/tpope/vim-endwise)
	- [vim-eunuch](https://github.com/tpope/vim-eunuch)
	- [vim-fugitive](https://github.com/tpope/vim-fugitive)
    - [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object)
    - [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object)
	- [vim-markdown](https://github.com/preservim/vim-markdown)
	- [vim-obsession](https://github.com/tpope/vim-obsession)
	- [vim-sensible](https://github.com/tpope/vim-sensible)
	- [vim-surround](https://github.com/tpope/vim-surround)
	- [vim-tbone](https://github.com/tpope/vim-tbone)
	- [which-key.nvim](https://github.com/folke/which-key.nvim)
    - [xeluxee/competitest.nvim](https://github.com/xeluxee/competitest.nvim)
 - [VSCodium](https://vscodium.com) — Extensions:
	- [Code-Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
	- [Competitive Programming Helper](https://marketplace.visualstudio.com/items?itemName=DivyanshuAgrawal.competitive-programming-helper)
	- [Office Viewer](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-office)
	- [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)

### Terminal stuff:
 - [Alacritty](https://alacritty.org/)
 - [CMus](https://cmus.github.io/)
 - [Ranger](https://github.com/ranger/ranger)
 - [Termux](https://f-droid.org/en/packages/com.termux/)
 - [Tmux](https://github.com/tmux/tmux)
 - [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10): Ubuntu 20.04 LTS
 - [Windows Terminal](http://aka.ms/windowsterminal)
 - [ZSH](https://www.zsh.org/)

### General tools:
 - [Firefox](https://www.mozilla.org/en-US/firefox/new/) — Extensions:
	- [AdNauseam](https://addons.mozilla.org/en-US/firefox/addon/adnauseam/)
	- [Block Site](https://addons.mozilla.org/en-US/firefox/addon/block-website/)
	- [BrowserToys](https://github.com/SiddhantAttavar/BrowserToys-Extension)
	- [CanvasBlocker](https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/)
	- [Competitive Companion](https://addons.mozilla.org/en-US/firefox/addon/competitive-companion/)
	- [Cookie AutoDelete](https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/)
	- [Enhancer for YouTube](https://addons.mozilla.org/en-US/firefox/addon/enhancer-for-youtube/)
	- [GNOME Shell Integration](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/)
	- [LanguageTool](https://addons.mozilla.org/en-US/firefox/addon/languagetool/)
	- [PassFF](https://addons.mozilla.org/en-US/firefox/addon/passff/)
	- [Privacy Badger](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger/)
	- [Reddit Enhancement Suite](https://addons.mozilla.org/en-US/firefox/addon/reddit-enhancement-suite/)
	- [Return YouTube Dislike](https://addons.mozilla.org/en-US/firefox/addon/return-youtube-dislikes/)
	- [Simple Translate](https://addons.mozilla.org/en-US/firefox/addon/simple-translate/)
	- [SponsorBlock for YouTube](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
	- [Stylus](https://addons.mozilla.org/en-US/firefox/addon/stylus/)
	- [Tampermonkey](https://addons.mozilla.org/en-US/firefox/addon/tampermonkey/)
	- [Tridactyl](https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/)
	- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
 - [Powertoys](https://docs.microsoft.com/en-us/windows/powertoys/)
 - [Qutebrowser](https://qutebrowser.org)

### Android apps:
 - [1.1.1.1](https://play.google.com/store/apps/details?id=com.cloudflare.onedotonedotonedotone)
 - [Aegis](https://f-droid.org/en/packages/com.beemdevelopment.aegis)
 - [Aurora Store](https://f-droid.org/en/packages/com.aurora.store/)
 - [Discord](https://play.google.com/store/apps/details?id=com.discord)
 - [F-Droid](https://f-droid.org/en/packages/org.fdroid.fdroid/)
 - [Firefox](https://play.google.com/store/apps/details?id=org.mozilla.firefox)
 - [Florisboard](https://f-droid.org/en/packages/dev.patrickgold.florisboard/)
 - [GMaps WV](https://f-droid.org/en/packages/us.spotco.maps/)
 - [KDE Connect](https://f-droid.org/en/packages/org.kde.kdeconnect_tp/)
 - [KISS Launcher](https://f-droid.org/en/packages/fr.neamar.kiss/)
 - [Metro](https://f-droid.org/en/packages/io.github.muntashirakon.Music/)
 - [Newpipe](https://f-droid.org/en/packages/org.schabi.newpipe/)
 - [NoSurf for Reddit](https://f-droid.org/en/packages/com.aaronhalbert.nosurfforreddit/)
 - [NTA Abhiyas](https://play.google.com/store/apps/details?id=com.abhyas.nta.com)
 - [Ola](https://play.google.com/store/apps/details?id=com.olacabs.customer)
 - [OpenCalc](https://f-droid.org/en/packages/com.darkempire78.opencalculator/)
 - [OpenScan](https://apt.izzysoft.de/fdroid/index/apk/com.ethereal.openscan)
 - [Organic Maps](https://f-droid.org/en/packages/app.organicmaps/)
 - [Pineapple Lock Screen](https://f-droid.org/en/packages/net.blumia.pineapple.lockscreen.oss/)
 - [Simple Calendar](https://f-droid.org/en/packages/com.simplemobiletools.calendar.pro/)
 - [Simple Camera](https://f-droid.org/en/packages/com.simplemobiletools.camera/)
 - [Simple Clock](https://f-droid.org/en/packages/com.simplemobiletools.clock/)
 - [Simple Contacts](https://f-droid.org/en/packages/com.simplemobiletools.contacts.pro/)
 - [Simple Dialer](https://f-droid.org/en/packages/com.simplemobiletools.dialer/)
 - [Simple File Manager](https://f-droid.org/en/packages/com.simplemobiletools.filemanager.pro/)
 - [Simple Gallery](https://f-droid.org/en/packages/com.simplemobiletools.gallery.pro/)
 - [Simple SMS Messenger](https://f-droid.org/en/packages/com.simplemobiletools.smsmessenger/)
 - [Termux](https://f-droid.org/en/packages/com.termux/)
 - [Uber](https://play.google.com/store/apps/details?id=com.ubercab)
 - [ViMusic](https://f-droid.org/en/packages/it.vfsfitvnm.vimusic/)
 - [WhatsApp](https://play.google.com/store/apps/details?id=com.whatsapp)
