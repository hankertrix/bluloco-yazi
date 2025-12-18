# The VHS tape to take all the screenshots

# The required applications to generate the screenshots
Require yazi

# Settings for the screenshots
Set FontSize 20
Set FontFamily "Maple Mono NF CN"
Set Theme "BlulocoDark"
Set Padding 20
Set Margin 0

# Open Yazi
Type "yazi" Enter

# Wait a while
Sleep 200ms

# Search for HTML to hover over the HTML file
Type "/html" Enter

# Screenshot the file list
Screenshot ../screenshots/files-dark.png

# Wait a while
Sleep 200ms

# Open the spotter
Tab

# Screenshot the spotter
Screenshot ../screenshots/spotter-dark.png

# Wait a while
Sleep 200ms

# Close the spotter
Escape

# Open the help menu
Type "~"

# Screenshot the help menu
Screenshot ../screenshots/help-dark.png

# Wait a while
Sleep 200ms

# Close the help menu
Escape

# Close yazi
Type "q"
