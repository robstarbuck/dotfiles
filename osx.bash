# CITE:https://github.com/herrbischoff/awesome-osx-command-line/blob/master/functions.md#get-path-of-frontmost-finder-window
selected() {
    selected=$(osascript <<EOT
        tell application "Finder"
            set theFiles to selection
            set myList to {}
            repeat with aFile in theFiles
                copy POSIX path of (aFile as alias) to end of myList
            end repeat
            # Do not know how to escape a single quote in a heredoc, as a result the line beneath is a requirement
            set Applescript's text item delimiters to "DUMMY"
            set AppleScript's text item delimiters to ":"
            myList as string
        end tell
EOT)
echo $selected | tr ":" "\n"
}
# echo $(plus1 8)
export -f selected