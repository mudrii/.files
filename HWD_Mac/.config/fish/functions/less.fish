function less --description "wrap the 'less' page opener to use color in formatting"

  set -gx LESSOPEN '|pygmentize -f terminal256 -g -P style=monokai %s'
  set -gx LESS '-R'

  command less $argv
end

