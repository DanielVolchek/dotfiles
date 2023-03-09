#!/bin/bash

# get directory of script (ty copilot)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#check if tmux.conf exists
if [ -f ~/.tmux.conf ]; then
    echo "tmux.conf already exists, backing up to tmux.conf.bak"
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi

if [ -f ~/.tmux.conf.local ]; then
    echo "tmux.conf.local already exists, backing up to tmux.conf.local.bak"
    mv ~/.tmux.conf.local ~/.tmux.conf.local.bak
fi

if [-f ~/.tmate.conf]; then
    echo "tmate.conf already exists, backing up to tmate.conf.bak"
    mv ~/.tmate.conf ~/.tmate.conf.bak
fi

#link tmux.conf && tmux.conf.local to home
ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/tmux.conf.local ~/.tmux.conf.local
ln -s $DIR/tmux.conf ~/.tmate.conf

tmux source-file ~/.tmux.conf
