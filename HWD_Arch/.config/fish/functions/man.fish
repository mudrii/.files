function man --description "wrap the 'man' manual page opener to use color in formatting"
  
  # start of bold:
  ##set -x LESS_TERMCAP_md (set_color --bold red)
  # end of all formatting:
  ##set -x LESS_TERMCAP_me (set_color normal)

  # start of standout (inverted colors):
  #set -x LESS_TERMCAP_so (set_color --reverse)
  # end of standout (inverted colors):
  #set -x LESS_TERMCAP_se (set_color normal)
  # (no change – I like the default)

  # start of underline:
  #set -x LESS_TERMCAP_us (set_color --underline)
  # end of underline:
  #set -x LESS_TERMCAP_ue (set_color normal)
  # (no change – I like the default)

  set -gx LESS_TERMCAP_md \e'[01;31m'
  set -gx LESS_TERMCAP_me \e'[0m'
  set -gx LESS_TERMCAP_se \e'[0m'
  set -gx LESS_TERMCAP_so \e'[01;44;33m'
  set -gx LESS_TERMCAP_ue \e'[0m'
  set -gx LESS_TERMCAP_us \e'[01;32m'

  command man $argv
end
