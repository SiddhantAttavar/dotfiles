# ALIASES
# some ls aliases
function ll {Get-ChildItem -Force}
function la {Get-ChildItem -Force}
Set-Alias l 'Get-ChildItem'

# rm alias
If (Test-Path Alias:rm) {Remove-Item Alias:rm}
If (Test-Path Alias:rm) {Remove-Item Alias:rm}
function rm {Remove-Item -Recurse $args}

# touch alias
Set-Alias touch 'New-Item'
function c { Get-ChildItem . -Recurse | ? { $_.PSIsContainer } | Invoke-Fzf | Set-Location}

# git aliases
function gsync {git pull; git push}
function gs {git status;}
function gd {git diff;}
function gca {git add .; git commit -m $args[0]}
function gcap {git add .; git commit -m $args[0]; git push}

# winget aliases
function update {winget upgrade --all --accept-package-agreements --accept-source-agreements}

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# New-Alias <alias> <aliased-command>
New-Alias open ii

# Fzf setup
Import-Module PSReadLine
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
#Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
#Set-PsFzfOption -TabExpansion
Set-PsFzfOption -EnableAliasFuzzyEdit
