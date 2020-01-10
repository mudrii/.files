#!/bin/sh

i3-msg "workspace 2; append_layout ~/.config/i3/workspace_2.json"

# And finally we fill the containers with the programs they had
(code &)
(urxvt -e tmux &)

#i3-save-tree --workspace 2 > ~/.config/i3/workspace_2.json
#tail -n +2 ~/.config/i3/workspace_2.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_2.1.json
