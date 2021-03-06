$DotfilesDir = $PSScriptRoot

function Test-ReparsePoint([string]$Path) {
  $File = Get-Item $Path -Force -ea SilentlyContinue
  return [bool]($File.Attributes -band [IO.FileAttributes]::ReparsePoint)
}

function Create-Symlink($Source, $Dest) {
		$Curr = "$DotfilesDir/$Source";
		$DateStr = Get-Date -Format "dd/MM/yyyy_HH-mm"
		
		if (Test-ReparsePoint $Dest) {
				rm $Dest
		}
		elseif (Test-Path -Path $Dest) {
				echo "Removing existing file/dir"
				echo "$Dest.$DateStr"
				mv $Dest "$Dest.$DateStr"
		}

		echo "Creating new symlink: $Dest"
		New-Item -Path $Dest -ItemType SymbolicLink -Value $Source
}

# Installing programs
echo "Installing programs"
winget install Neovim.Neovim
winget install Git.Git
winget install Google.Drive
winget install Microsoft.VisualStudioCode
winget install Python.Python.3

# Create symlinks
echo "Creating symlinks"
Create-Symlink nvim ~/AppData/Local/nvim
Create-Symlink powershell/Microsoft.PowerShell_profile.ps1 ~/Documents/WindowsPowershell/Microsoft.PowerShell_profile.ps1

# Setup neovim: install vim-plug and plugins
echo "Installing Neovim plugins"
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
nvim --headless +PlugInstall +qa 2> /dev/null
