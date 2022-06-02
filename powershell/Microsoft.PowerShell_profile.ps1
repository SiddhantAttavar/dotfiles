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

# git aliases
function gsync {git pull; git push}
function gca {git add .; git commit -m $args[0]}
function gcap {git add .; git commit -m $args[0]; git push}

# winget aliases
function update {winget upgrade --all --accept-package-agreements --accept-source-agreements}
