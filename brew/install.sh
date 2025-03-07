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
brew install git # the all important git
brew install gh # github authenticator
brew install nvm # node version manager
brew install yarn # alternate to npm
brew install vim # always good to have
brew install neovim # <3
brew install ncurses # for neovim
brew install tmux # terminal multiplexer
brew install tmate # tmux over ssh
brew install jq # json parser
brew install lazygit # git tui
brew install glow # markdown viewer
brew install bat # better cat
brew install httpie # http client for terminal
brew install ripgrep # live grep for neovim telescope
#brew install spotify-tui # spotify tui
#brew install spotifyd # spotify daemon
# brew install fontforge # custom nerd font patcher
brew install htop # show processes
brew install fzf # fuzzy finder
brew install zoxide # better cd command
brew install cowsay # just for fun
brew install fastfetch # just for fun
brew install rust # rust lang
brew install go # golang

# install essential casks
brew install --cask iterm2 # best term emulator
brew install --cask arc # primary browser 
brew install --cask google-chrome # basic browser for testing
brew install --cask spotify # music player
brew install --cask amethyst # manage windows
brew install --cask insomnia # API endpoint tester
brew install --cask raycast # better spotlight search
brew install --cask alt-tab # better icons in cmd-tab switcher
brew install --cask font-caskaydia-cove-nerd-font # nice font
brew install --cask font-hack-nerd-font # nice font
brew install --cask visual-studio-code # good to have just in case but I never use it
brew install --cask discord # team communication 
brew install --cask slack # team communication 
brew install --cask ticktick # todo list app
brew install --cask google-drive # syncs files, at the end because it asks for password to install
brew install --cask zoom # video conference software
brew install --cask linear-linear
brew install --cask obsidian

#cascadia code
#oxygen mono
#space mono
