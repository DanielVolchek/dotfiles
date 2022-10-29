#!/bin/bash

# get directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link all files in this directory to home directory
ln -s $DIR/zshrc ~/.zshrc
ln -s $DIR/oh-my-zsh ~/.oh-my-zsh
ln -s $DIR/p10k.zsh ~/.p10k.zsh
ln -s $DIR/powerlevel10k ~/powerlevel10k
