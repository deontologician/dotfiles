# Path to Oh My Fish install.
set -gx OMF_PATH "/home/josh/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/josh/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# PATH
if status --is-login
        set -gx PATH $PATH /usr/local/bin ~/scripts ~/.cabal/bin ~/.npm-packages/bin
        set -gx WORKON_HOME ~/.virtualenvs
        set -gx PROJECT_HOME ~/Code
        set -gx JAVA_HOME /usr/lib/jvm/default
end

set -gx TERM xterm-256color
