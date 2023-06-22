#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Current Ticket
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📓

# Documentation:
# @raycast.description Toggles the current active ticket in obsidian

# set TICKET_URI to "obsidian://open?vault=work_notes&file=clover%2FTickets%2FActive_Tickets%2FCSI-4857"
set TICKET_URI to (read POSIX file "/Users/daniel.volchek/dotfiles/raycast/TICKET_URI.txt" as «class utf8» using delimiter linefeed)

tell application "System Events"
    set obsidianProcess to application process "Obsidian"
    if visible of obsidianProcess is true then
        set visible of obsidianProcess to false
    else
      set visible of obsidianProcess to true
      open location TICKET_URI
    end if
end tell

