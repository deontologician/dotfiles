# Fix terminal output unicode
export LC_ALL en_US.UTF-8

start-pulseaudio-x11

# Remap keys (Esc -> ~, and Home -> Ctrl)
xmodmap ~/.xmodmap
# Allow horizontal scrolling with 2 fingers
synclient HorizTwoFingerScroll=1
synclient MiddleButtonAreaLeft=3068
synclient TapButton1=1
synclient TapButton2=0
# tapping with 3 fingers is a right click
synclient TapButton3=3
# Clicking is the same as tapping, no other clicks recognized
synclient ClickFinger1=1
synclient ClickFinger2=0
synclient ClickFinger3=0
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
# network tray tool
connman-ui-gtk &
# Start the bluetooth app
blueman-applet &
# Redshift modifies the color temperature of the screen by time of day (Flux)
# redshift -l 37.3875:-122.0661 &
# tokyo redshift
redshift -l 35.6895:-139.6917 &
# ibus daemon is for japanese input
ibus-daemon -drx
# Battery monitor
batterymon &
# Dropbox
~/.dropbox-dist/dropboxd &
# Emacs server (connect to this with `emacsclient`)
emacs --daemon
# Auto disk mounting
udiskie --tray &
# Rescuetime tracker
rescuetime &
# Compton compositor
compton --config $HOME/.config/compton/conf --paint-on-overlay -b &
# Set wallpaper
feh -z --bg-fill /home/josh/Wallpaper
# Start the window manager
#exec awesome
exec qtile
