function dmesg --description 'alias dmesg dmesg --color=always | less'
  command dmesg --color=always | less $argv;
end
