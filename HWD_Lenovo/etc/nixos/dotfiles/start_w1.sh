#!/bin/sh

i3-msg "workspace 1; append_layout ~/.config/i3/workspace_1.json"

# And finally we fill the containers with the programs they had
(firefox&)
(alacritty -e tmux new -s 1 &)
#(urxvt &)

#i3-save-tree --workspace 1 > ~/.config/i3/workspace_1.json
#tail -n +2 ~/.config/i3/workspace_1.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_1.json
