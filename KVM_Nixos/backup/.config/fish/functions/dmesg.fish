# Defined in - @ line 1
function dmesg --description 'alias dmesg dmesg --color=always | less'
	command dmesg --color=always | less $argv;
end
