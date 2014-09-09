#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1
#PS1='[\u@\h \W]\$ '
if [ $UID -ge 1000 ]; then
    PS1="\[\033[37m\]┏─[\[\e[36m\]\u\[\033[0m\]@\[\e[32m\]\H\[\033[37m\]]─[\[\033[0;33m\]\$(date \"+%H:%M\")\[\033[37m\]] \n\[\033[37m\]┗─[\[\033[0;36m\]\W\[\033[37m\]]> \[\e[0m\]"
elif [ $UID -eq 0 ]; then
    PS1="\[\033[37m\]┏─[\[\033[0;31m\]\u\[\033[0m\]@\[\e[32m\]\H\[\033[37m\]]─[\[\033[0;33m\]\$(date \"+%H:%M\")\[\033[37m\]] \n\[\033[37m\]┗─[\[\033[0;36m\]\W\[\033[37m\]]> \[\e[0m\]"
fi

# 设置终端为256色
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# emacs aliases
alias en='emacs -nw'
alias et='emacsclient -t -a ""'
alias ec='emacsclient -c -a ""'


## take a timestamped screenshot
shot(){
      local PIC="${HOME}/photos/screenshot/screenshot-$(date +%Y-%m-%d_%H:%M:%S).png"
	scrot $PIC
}
# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

# Extract Stuff
extract () {
if [ -f $1 ]; then
    case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       unrar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via 
extract()"
;;
         esac
else
         echo "'$1' is not a valid file"
fi
}

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
#export COCOS_CONSOLE_ROOT=${HOME}/workspace/cocos2d-x-3.1/tools/cocos2d-console/bin
#export PATH=$COCOS_CONSOLE_ROOT:$PATH
