# Defined in - @ line 1
function la --description 'alias la ls -lha --color=auto --group-directories-first'
	gls -lha --color=auto --group-directories-first $argv;
end
