#!/usr/bin/env bash

# Abort on error
set -e

echo "Checking if Homebrew is already installed..."; 

# Checks if Homebrew is installed
# Credit: https://gist.github.com/codeinthehole/26b37efa67041e1307db
if test ! $(which brew); then
  echo "Installing Homebrew...";
  yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew is already installed...";
fi

# install important packages
brew install git
brew install gh
brew install nvm
brew install yarn
brew install vim
brew install neovim
brew install ncurses
brew install tmux
brew install jq
brew install lazygit
brew install glow
brew install bat
brew install spotify-tui
brew install spotifyd
brew install htop




# install essential casks
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask insomnia
brew install --cask alt-tab
brew installl --cask font-hack-nerd-font
brew install --cask visual-studio-code
