# personal config settings for zsh
# not sure how much stuff will ever really be here but for now its just vi mode
#
bindkey -v
export KEYTIMEOUT=20

bindkey -M viins 'jk' vi-cmd-mode

# set editor to open nvim for scripts that open an editor
export EDITOR=nvim

# set case sensitivity to ignore for "z"
export ZSHS_CASE=ignore

# add user dir bin
export PATH=$PATH:$HOME/bin

# add path to config
export XDG_CONFIG_HOME=$HOME/.config

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home"
