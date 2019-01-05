#!/bin/bash

i3-msg "workspace 4; append_layout ~/.config/i3/workspace_4.json"

# And finally we fill the containers with the programs they had
(urxvt -e ranger &)

#i3-save-tree --workspace 3 > ~/.config/i3/workspace_3.json
#tail -n +2 ~/.config/i3/workspace_3.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_3.1.json
