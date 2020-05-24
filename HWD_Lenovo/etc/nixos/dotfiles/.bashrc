# ~/.bashrc

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

# add ssh key to ssh-agent rsa and dsa keys
#eval `keychain --eval --quiet --agents ssh id_rsa id_dsa`

#[ -z "$PS1" ] && return

#if [[ ${EUID} == 0 ]] ; then
#PS1='\[\e[01;31m\]\h\[\e[01;34m\] \W \$\[\e[00m\] '
#else
#PROMPT_COMMAND='__git_ps1 "\[\e[01;32m\]\u@\h\[\e[01;36m\] \W\[\e[00m\]" " \\\$ "'
#fi

# git completion
# curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash --output ~/.git-completion.bash
source ~/.git-completion.bash

# git prompth
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output ~/.git-prompt.sh
source ~/.git-prompt.sh

#export EDITOR=vim
#set -o noclobber
shopt -sq checkwinsize
export HISTSIZE=100000
export HISTFILESIZE=1000000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"

# clean mannualy history
#history | sort -urk2 | sort -n | sed 's/^ \+[0-9]\+ \+//' > /tmp/history.tmp && mv -f /tmp/history.tmp $HISTFILE
#tac $HISTFILE | awk '!x[$0]++' | tac > /tmp/history.tmp && mv -f /tmp/history.tmp $HISTFILE
#nl ~/.bash_history | sort -k 2  -k 1,1nr| uniq -f 1 | sort -n | cut -f 2 > /tmp/history.tmp && mv -f /tmp/history.tmp $HISTFILE

# set dircollors for ls
eval "`dircolors -b ~/.dircolors`"

# less colors
#export LESSOPEN='|pygmentize -f terminal256 -g -P style=monokai %s'
#export LESS='-R'

# man pages in colores
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# extract decompress
ext () {
 if [ -f $1 ] ; then
     case $1 in
         *.tar.bz2)   tar xvjf $1    ;;
         *.tar.gz)    tar xvzf $1    ;;
         *.bz2)       bunzip2 $1     ;;
         *.rar)       unrar $1       ;;
         *.gz)        gunzip $1      ;;
         *.tar)       tar xvf $1     ;;
         *.tbz2)      tar xvjf $1    ;;
         *.tgz)       tar xvzf $1    ;;
         *.zip)       unzip $1       ;;
         *.Z)         uncompress $1  ;;
         *.7z)        bsdtar xf $1   ;;
         *)           echo "don't know how to extract '$1'..." ;;
     esac
 else
     echo "'$1' is not a valid file!"
 fi
}

# Powerline for bash 

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh

# TMUX
#if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
#    test -z "$TMUX" && (tmux attach || tmux new-session)
#fi

#export PATH=$PATH:~/local/bin
#PATH=$PATH:~/.local/bin:~/go/bin

