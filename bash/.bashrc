# TERMINAL CONFIG
# Run general shell configuration
if [ -f ~/.shrc ]; then
	. ~/.shrc
fi

# Hide user name and host name in terminal prompt
color_prompt=yes
if [ "$color_prompt" = yes ]; then
	PS1='\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]》'
else
    PS1='\w》'
fi

unset color_prompt force_color_prompt

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\w\a\]$PS1"
    ;;
*)
    ;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# FZF setup
[ -f /usr/share/doc/fzf/examples/completion.bash ] && source /usr/share/doc/fzf/examples/completion.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
[ -f /data/data/com.termux/files/usr/share/fzf/completion.bash ] && source /data/data/com.termux/files/usr/share/fzf/completion.bash
[ -f /data/data/com.termux/files/usr/share/fzf/key-bindings.bash ] && source /data/data/com.termux/files/usr/share/fzf/key-bindings.bash
