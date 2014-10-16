start-pulseaudio-x11

# Remap keys
setxkbmap -option ctrl:nocaps
xmodmap ~/.xmodmap
# Allow horizontal scrolling with 2 fingers
synclient HorizTwoFingerScroll=1
synclient TapButton2=-1
synclient RightButtonAreaLeft=0
synclient RightButtonAreaTop=0
synclient MiddleButtonAreaLeft=3068
synclient PalmDetect=1
synclient PalmMinWidth=4
# Disable touchpad while typing
# -t don't ignore movement, just taps
# -i How many seconds to wait before re-enabling the taps
# -d Start as a daemon
# -K don't consider mod keys as keyboard usage
syndaemon -t -K -i 2 &
# Wicd is the network tray tool
wicd-client -t &
# Redshift modifies the color temperature of the screen by time of day (Flux)
redshift -l 37.3875:-122.0661 &
# Battery monitor
batti &
# Dropbox
dropboxd &
# Emacs server (connect to this with `emacsclient`)
emacs --daemon
# Auto disk mounting
udiskie --tray &
# Compton compositor
compton --config $HOME/.config/compton/conf --paint-on-overlay -b &
# Start the window manager
exec awesome
