#!/bin/sh

i3-msg "workspace 3; append_layout ~/.config/i3/workspace_3.json"

# And finally we fill the containers with the programs they had
#(brave &)
(qutebrowser &)
(alacritty -e tmux new -s 2 &)

#i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
#tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_3.1.json
