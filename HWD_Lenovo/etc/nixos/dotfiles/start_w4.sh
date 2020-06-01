#!/bin/sh

i3-msg "workspace 4; append_layout ~/.config/i3/workspace_4.json"

# And finally we fill the containers with the programs they had
#(urxvt -e ranger &)
#(urxvt -e tmux &)
(alacritty -e ranger &)
(alacritty -e tmux new -s 3 &)

#i3-save-tree --workspace 4 > ~/.config/i3/workspace_4.json
#tail -n +2 ~/.config/i3/workspace_4.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_4.1.json
