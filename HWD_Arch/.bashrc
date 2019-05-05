#
# ~/.bashrc
#

exec fish

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# add ssh key to ssh-agent rsa and dsa keys
#eval `keychain --eval --quiet --agents ssh id_rsa id_dsa`

[ -z "$PS1" ] && return

if [[ ${EUID} == 0 ]] ; then
PS1='\[\e[01;31m\]\h\[\e[01;34m\] \W \$\[\e[00m\] '
else
PROMPT_COMMAND='__git_ps1 "\[\e[01;32m\]\u@\h\[\e[01;36m\] \W\[\e[00m\]" " \\\$ "'
fi

# git completion
# curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash --output ~/.git-completion.bash
source ~/.git-completion.bash

# git prompth
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh --output ~/.git-prompt.sh
source ~/.git-prompt.sh

export EDITOR=vim
#set -o noclobber
shopt -sq checkwinsize
export HISTSIZE=100000
export HISTFILESIZE=1000000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"

# cplean mannualy history
#history | sort -urk2 | sort -n | sed 's/^ \+[0-9]\+ \+//' > /tmp/history.tmp && mv -f /tmp/history.tmp $HISTFILE
#tac $HISTFILE | awk '!x[$0]++' | tac > /tmp/history.tmp && mv -f /tmp/history.tmp $HISTFILE
#nl ~/.bash_history | sort -k 2  -k 1,1nr| uniq -f 1 | sort -n | cut -f 2 > /tmp/history.tmp && mv -f /tmp/history.tmp $HISTFILE

# set dircollors for ls
eval "`dircolors -b ~/.dircolors`"

# aliases
alias ccat="pygmentize -f terminal256 -g -P style=monokai"
alias la="ls -lha --color=auto --group-directories-first"
alias dmesg="dmesg --color=always | less"
alias sudo="sudo -i"
alias ls="ls --color=auto"
alias diff="diff --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias ll="ls -lah"
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias exit="clear ; exit"
alias ping="ping -c3"
alias k="kubectl"
alias ktx="kubectx"
alias kns="kubens"
alias t="terraform"
alias g="gcloud"
alias a="aws"
alias p="python"

#ose docker aliases
alias aws='docker run --rm -tiv $HOME/.aws:/home/mudrii/.aws mudrii/aws-cli aws'
alias gcloud-beta='docker run -ti --rm  -v ~/:/home/mudrii mudrii/gcloud-beta-cli gcloud beta'
alias gcloud='docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/gcloud-cli gcloud'
alias gsutil='docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/gcloud-cli gsutil'
alias helm='docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/helm-cli helm'
alias gkubectl='docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/gkubectl-cli kubectl'
alias packer='docker run -it --rm -v $(pwd):/app/ -w /app/ mudrii/packer-cli packer'
alias terraform='docker run -it --rm -v ${HOME}:/home/mudrii -v $(pwd):/app/ -w /app/ mudrii/terraform-cli terraform'
alias tflint='docker run -it --rm -v $(pwd):/app/ -w /app/ mudrii/tflint-cli tflint'
alias powershell='docker run -it --rm microsoft/powershell'
alias az='docker run -v ${HOME}:/root -it --rm azuresdk/azure-cli-python az'
alias asciicast2gif='docker run --rm -v $PWD:/data asciinema/asciicast2gif'
alias julia="docker run -it --rm -v "$PWD":/usr/myapp -w /usr/myapp julia julia"
alias py="docker run -it --rm -v "$PWD":/usr/src -w /usr/src python:latest python"
alias kubectl='docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli kubectl'
#alias kubectl='docker run -ti --rm  -v ~/:/home/mudrii/ mudrii/kubectl-cli sh -c export PATH=$PATH:/app/bin; kubectl'
#alias aws='docker run --rm -tiv $HOME/.aws:/home/mudrii/.aws -v $(pwd):/aws mudrii/aws-cli aws'
#alias terraform='docker run -it --rm -e GOOGLE_CREDENTIALS=/root/.config/gcloud/terraform-admin.json -v ${HOME}:/root -v $(pwd):/app/ -w /app/ mudrii/terraform-cli terraform'
#alias kubectl='docker run -ti --rm  -v ~/:/root/ mudrii/kubectl-cli kubectl'
#alias kubectl='docker run -ti --rm  -v ~/:/root/ mudrii/kubectl-cli sh -c export PATH=$PATH:/app/bin; kubectl'
#alias kubectl='docker run -ti --rm -v ~/:/app -w /app/ mudrii/kube kubectl'
#alias helm='docker run -ti --rm -v ~/:/root mudrii/kube helm'

# import input rc for bash history
export INPUTRC=~/.inputrc

# less colors
#export LESS='-R'
export LESSOPEN='|pygmentize -f terminal256 -g -P style=monokai %s'
export LESS='-R'

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
         *.rar)       rar x $1       ;;
         *.gz)        gunzip $1      ;;
         *.tar)       tar xvf $1     ;;
         *.tbz2)      tar xvjf $1    ;;
         *.tgz)       tar xvzf $1    ;;
         *.zip)       unzip $1       ;;
         *.Z)         uncompress $1  ;;
         *.7z)        7z x $1        ;;
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
PATH=$PATH:~/.local/bin:~/go/bin

# startup shell notification
screenfetch