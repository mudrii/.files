#!/bin/sh

i3-msg "workspace 6; append_layout ~/.config/i3/workspace_6.json"

# And finallyt we fill the containers with the programs they had
(keepassxc &)
(sublime3 &)

#i3-save-tree --workspace 6 > ~/.config/i3/workspace_6.json
#tail -n +2 ~/.config/i3/workspace_6.json | fgrep -v '// splitv' | sed 's|//||g' > ~/.config/i3/workspace_6.1.json
