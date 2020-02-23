{ pkgs, ... }:

{
  home-manager.users.mudrii.home.file.".inputrc".text = ''
#.inputrc
"\e[A": history-search-backward
"\e[B": history-search-forward
"\e[C": forward-char
"\e[D": backward-char
#"\eOA": history-search-backward
#"\eOB": history-search-forward
#"\eOC": forward-char
#"\eOD": backward-char
#"\e[A": history-search-backward
#"\e[B": history-search-forward
#"\e[C": forward-char
#"\e[D": backward-char
#"\C-x\C-r": re-read-init-file
set match-hidden-files off
set page-completions off
set completion-query-items 350
set completion-ignore-case on
set show-all-if-ambiguous on
set bell-style none
TAB: menu-complete
'';
}
