# Remap keys
setxkbmap -option ctrl:nocaps
xmodmap ~/.xmodmap
# Allow horizontal scrolling with 2 fingers
synclient HorizTwoFingerScroll=1
# Disable touchpad while typing
# -t don't ignore movement, just taps
# -i How many seconds to wait before re-enabling the taps
# -d Start as a daemon
syndaemon -t -k -i 2 & ## disabled because it's annoying, palm detection is pretty ok
# Wicd is the network tray tool
wicd-client -t &
# Redshift modifies the color temperature of the screen by time of day (Flux)
redshift-gtk -l 27:-82 &
# Battery monitor
batti &
# Dropbox
dropboxd &
# Emacs server (connect to this with `emacsclient`)
emacs --daemon
# Compton compositor
compton --config $HOME/.config/compton/conf --paint-on-overlay -b &
# Start the window manager
exec awesome
