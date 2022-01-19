# dotfiles
My personal configuration for Windows and WSL
My personal configuration for Windows

## Programs and other things I use <a name = "programs"></a>
IDEs and editors:
 - [Visual Studio Code](https://code.visualstudio.com/) - Extensions:
	- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
	- [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
	- [Competitive Programming Helper](https://marketplace.visualstudio.com/items?itemName=DivyanshuAgrawal.competitive-programming-helper)
	- [Github Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)
	- [Office Viewer](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-office)
	- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
	- [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
	- [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)
 - [Neovim](https://neovim.io/) - Plugins (using [Vim-plug](https://github.com/junegunn/vim-plug)):
	- [onedark](https://github.com/navarasu/onedark.nvim)
	- [fzf](https://github.com/junegunn/fzf.vim)
	- [vim-fugitive](https://github.com/tpope/vim-fugitive)
	- [copilot](https://github.com/github/copilot.vim)
	- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
	- [vim-devicons](https://github.com/ryanoasis/vim-devicons)
	- [barbar](https://github.com/romgrk/barbar.nvim)
	- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
	- [lualine](https://github.com/nvim-lualine/lualine.nvim)
	- [cpbooster](https://github.com/searleser97/cpbooster.vim)

Terminal stuff:
 - [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10): Ubuntu 20.04 LTS
 - [Windows Terminal](http://aka.ms/windowsterminal)

Languages and Other development tools:
 - [Python](https://www.python.org/) - Packages:
	- [anvil-app-server](https://pypi.org/project/anvil-app-server/)
	- [anvil-uplink](https://pypi.org/project/anvil-uplink/)
	- [json](https://pypi.org/project/json/)
	- [jupyter](https://pypi.org/project/jupyter/)
	- [matplotlib](https://pypi.org/project/matplotlib/)
	- [networkx](https://pypi.org/project/networkx/)
	- [numpy](https://pypi.org/project/numpy/)
	- [pandas](https://pypi.org/project/pandas/)
	- [Pillow](https://pypi.org/project/Pillow/)
	- [pyinstaller](https://pypi.org/project/pyinstaller/)
	- [requests](https://pypi.org/project/requests/)
	- [tensorflow](https://pypi.org/project/tensorflow/)
	- [urllib3](https://pypi.org/project/urllib3/)
	- [scipy](https://pypi.org/project/scipy/)
 - [Mingw-w64 with C++ compiler](https://sourceforge.net/projects/mingw-w64/)
 - [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) - Packages:
	- [cpbooster](https://github.com/searleser97/cpbooster)

General tools:
 - [Microsoft Edge](https://www.microsoft.com/en-us/edge) - Extensions:
	- [Adblock](https://microsoftedge.microsoft.com/addons/detail/adblock-%E2%80%94-best-ad-blocker/ndcileolkflehcjpmjnfbnaibdcgglog)
	- [BrowserToys](https://github.com/SiddhantAttavar/BrowserToys-Extension)
	- [Competitive Companion](https://chrome.google.com/webstore/detail/competitive-companion/cjnmckjndlpiamhfimnnjmnckgghkjbl)
	- [Google Docs Offline](https://chrome.google.com/webstore/detail/docs-offline/adlepfefemdignonambfpicinlbppbnl?hl=en)
	- [Grammarly](https://microsoftedge.microsoft.com/addons/detail/grammarly-for-microsoft-e/cnlefmmeadmemmdciolhbnfeacpdfbkd)
	- [Night Eye](https://microsoftedge.microsoft.com/addons/detail/night-eye-dark-mode-on-/gijhmcgnnbcpigflkfoimbnfjnbcphah)
	- [Return Youtube Dislike](https://chrome.google.com/webstore/detail/return-youtube-dislike/gebbhagfogifgggkldgodflihgfeippi)
 - [File Explorer](https://www.windows.com/en-us/downloads/file-explorer/)
 - [Notepad](https://www.microsoft.com/en-us/p/windows-notepad/9msmlrh6lzf3)
 - [Powertoys](https://docs.microsoft.com/en-us/windows/powertoys/)
 - [Google Drive Desktop](https://www.google.com/intl/en_in/drive/download/)
 - [fzf](https://github.com/junegunn/fzf)

## Setup <a name = "setup"></a>
### Windows <a name = "windows"></a>
 - Clone this repository: `git clone https://github.com/SiddhantAttavar/dotfiles.git`
 - cd into the dotfiles-windows directory: `cd dotfiles`
 - Run `setup.ps1` in PowerShell as an administrator with the command: `powershell -ExecutionPolicy Bypass -File setup.ps1`

### Linux <a name = "linux"></a>
 - Clone this repository: `git clone https://github.com/SiddhantAttavar/dotfiles.git ~/.dotfiles`
 - cd into the dotfiles-windows directory: `cd ~/.dotfiles`
 - Run `setup.sh` in bash as an administrator with the command: `bash setup.sh`

### Termux <a name = "termux"></a>
 - Clone this repository: `git clone https://github.com/SiddhantAttavar/dotfiles.git ~/.dotfiles`
 - cd into the dotfiles-windows directory: `cd ~/.dotfiles`
 - Run `termux-setup.sh` in bash as an administrator with the command: `bash termux-setup.sh`
