#set fish_function_path $fish_function_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
#powerline-setup

# Disable greeting
#set -g -x fish_greeting ''

set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_git_worktree_support no
set -g theme_display_vagrant no
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_hg no
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
#set -g theme_date_format "+%a %H:%M"
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts no
set -g theme_show_exit_status yes
#set -g default_user your_normal_user
set -g theme_color_scheme dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
#set -g theme_newline_cursor yes
#set -g theme_newline_prompt '$ '

set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

export LESSOPEN='|pygmentize -f terminal256 -g -P style=monokai %s'
export LESS='-R'

set -x EDITOR vim

function ps --description 'alias ps ps -ef'
  ps -ef  $argv;
end

function a --description 'alias a aws'
	aws  $argv;
end

function ccat --description 'alias ccat pygmentize -f terminal256 -g -P style=monokai'
	pygmentize -f terminal256 -g -P style=monokai $argv;
end

function cp --description 'alias cp cp -i'
	command cp -i $argv;
end

function diff --description 'alias diff diff --color=auto'
	command diff --color=auto $argv;
end

function dmesg --description 'alias dmesg dmesg --color=always | less'
	command dmesg --color=always | less $argv;
end

function egrep --description 'alias egrep egrep --color=auto'
	command egrep --color=auto $argv;
end

function fgrep --description 'alias fgrep fgrep --color=auto'
	command fgrep --color=auto $argv;
end

function grep --description 'alias grep grep --color=auto'
	command grep --color=auto $argv;
end

function k --description 'alias k kubectl'
	kubectl  $argv;
end

function la --description 'alias la ls -lha --color=auto --group-directories-first'
	ls -lha --color=auto --group-directories-first $argv;
end

function ll --description 'alias ll ls -lah'
	ls -lah $argv;
end

function ls --description 'alias ls ls --color=auto'
	command ls --color=auto $argv;
end

function mv --description 'alias mv mv -i'
	command mv -i $argv;
end

function p --description 'alias p python'
	python  $argv;
end

function ping --description 'alias ping ping -c3'
	command ping -c3 $argv;
end

function rm --description 'alias rm rm -i'
	command rm -i $argv;
end

function sudo --description 'alias sudo sudo -i'
	command sudo -i $argv;
end

function su
   command su --shell=/usr/bin/fish $argv
end

function t --description 'alias t terraform'
	terraform  $argv;
end

function vdir --description 'alias vdir vdir --color=auto'
	command vdir --color=auto $argv;
end

function gst --description 'alias git status'
  git status $argv;
end

function gcm --description 'alias git commit'
  git commit $argv;
end

function gad --description 'alias git add'
  git add . $argv;
end

function gadcm --description 'alias git add'
  git add -A; and git commit $argv;
end

function gdf --description 'alias git diff'
  git diff $argv;
end

function glg --description 'alias git log'
  git log $argv;
end

function gpl --description 'alias git push'
  git pull $argv;
end

function gps --description 'alias git push'
  git push $argv;
end

function ccd
  mkdir -p "$argv"
  and cd "$argv"
end
