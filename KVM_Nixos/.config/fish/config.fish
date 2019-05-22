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

#set -x EDITOR vim

export LESSOPEN='|pygmentize -f terminal256 -g -P style=monokai %s'
export LESS='-R'

#screenfetch

