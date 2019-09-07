#!/bin/bash

i3-msg "workspace 6; append_layout ~/.config/i3/workspace_6.json"

# And finally we fill the containers with the programs they had
(zoom &)
(slack &)
(eddie-ui &)

#i3-save-tree --workspace 6 > ~/.config/i3/workspace_6.json
#tail -n +2 ~/.config/i3/workspace_6.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_6.1.json
