# Remap keys (Esc -> ~, and Home -> Ctrl)
xmodmap ~/.xmodmap
# Allow horizontal scrolling with 2 fingers
synclient HorizTwoFingerScroll=1
# Disable touchpad while typing
# -K Ignore modifer keys when monitoring keyboard activity
# -i How many seconds to wait before re-enabling the mouse
# -d Start as a daemon
syndaemon -K -i 2 -d &
# Wicd is the network tray tool
wicd-client -t &
# Redshift modifies the color temperature of the screen by time of day (Flux)
redshift-gtk -l 27:-82 &
# Start pulseaudio
pulseaudio --start
# Pulse audio system tray applet
pasystray &
# Battery monitor applet
cbatticon &
# Dropbox
dropboxd &
# Emacs server (connect to this with `emacsclient`)
emacs --daemon
# Start the window manager
exec awesome
