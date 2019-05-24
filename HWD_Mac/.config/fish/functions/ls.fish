# Defined in - @ line 1
function ls --description 'alias ls ls --color=auto'
	command gls --color=auto $argv;
end
