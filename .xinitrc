# Remap keys (Esc -> ~, and Home -> Ctrl)
xmodmap ~/.xmodmap
# Allow horizontal scrolling with 2 fingers
synclient HorizTwoFingerScroll=1
# Disable touchpad while typing
# -K Ignore modifer keys when monitoring keyboard activity
# -i How many seconds to wait before re-enabling the mouse
# -d Start as a daemon
# syndaemon -K -i 2 -d & ## disabled because it's annoying, palm detection is pretty ok
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
compton --config /home/deontologician/.config/compton/conf --paint-on-overlay -b &
# Start the window manager
exec awesome
