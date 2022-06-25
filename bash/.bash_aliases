# ALIASES
# some ls aliases
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -Al --group-directories-first'
alias la='ls -A'
alias l='ls'

# clear screem alias
alias cls='clear'

# file management alias
alias rm='rm -r'
alias md='mkdir'

# git aliases
alias gsync='git pull; git push'
alias gs='git status'
alias gd='git diff'
alias gca='git add .; git commit -m'
gcap() { git add . ; git commit -m "$1" ; git push ; }

# apt aliases
alias update='sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y'
alias termuxupdate='pkg update -y; pkg upgrade -y'

# python aliases
alias python='python3'
alias py='python3'
