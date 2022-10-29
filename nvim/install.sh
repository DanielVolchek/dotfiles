#!/bin/bash

# get directory of script (ty copilot)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config/
ln -s $DIR/nvim ~/.config/nvim
