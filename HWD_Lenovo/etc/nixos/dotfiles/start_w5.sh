#!/bin/sh

i3-msg "workspace 5; append_layout ~/.config/i3/workspace_5.json"

# And finally we fill the containers with the programs they had
(urxvt -e ranger &)
(urxvt &)

#i3-save-tree --workspace 5 > ~/.config/i3/workspace_5.json
#tail -n +2 ~/.config/i3/workspace_5.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_5.1.json
