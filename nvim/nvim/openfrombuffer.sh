#!/bin/bash

# read piped input from neovim
input=$(cat)

# create temporary file from input
temp_file=$(mktemp)
echo "$input" > "$temp_file"
open -a TextEdit "$temp_file"

# select the lines
osascript -e 'tell application "System Events" to keystroke "a" using command down'

# wait 250 ms
sleep 0.25

# send custom bind (in this case ctrl+l) to open "explain this code" with the selected text
osascript -e 'tell application "System Events" to keystroke "l" using control down'

# wait 100ms
sleep 0.1

# close textedit
osascript -e 'tell application "TextEdit" to quit'

# wait 10ms
sleep 0.1

# run cmd + space in osascript to reopen raycast
osascript -e 'tell application "System Events" to keystroke " " using command down'

# remove the temporary file
rm "$temp_file"
