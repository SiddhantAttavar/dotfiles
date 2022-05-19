# ALIASES
# some ls aliases
alias ls='ls --group-directories-first'
alias ll='ls -Al --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls --group-directories-first'

# clear screem alias
alias cls='clear'

# rm alias
alias rm='rm -r'

# git aliases
alias gsync='git pull; git push'
alias gca='git add .; git commit -m'
gcap() { git add . ; git commit -m "$1" ; git push ; }

# apt aliases
alias update='sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y'
alias termuxupdate='pkg update; pkg upgrade -y'

# python aliases
alias python='python3'
alias py='python3'
