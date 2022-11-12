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

# brew taps
brew tap homebrew/cask-fonts

# install important packages
brew install git # the all important git
brew install gh # github authenticator
brew install nvm # node version manager
brew install yarn # alternate to npm
brew install vim # always good to have
brew install neovim # <3
brew install ncurses # for neovim
brew install tmux # terminal multiplexer
brew install jq # json parser
brew install lazygit # git tui
brew install glow # markdown viewer
brew install bat # better cat
brew install spotify-tui # spotify tui
brew install spotifyd # spotify daemon
brew install htop # show processes
brew install fzf # fuzzy finder
brew install fontforge # custom nerd font patcher

# install essential casks
brew install --cask iterm2 # best term emulator
brew install --cask google-chrome # might need to switch to firefox after manifest v3
brew install --cask insomnia # 
brew install --cask alt-tab # better icons in cmd-tab switcher
brew install --cask font-caskaydia-cove-nerd-font # nice font
brew install --cask font-hack-nerd-font # nice font
brew install --cask visual-studio-code # good to have just in case but I never use it

#cascadia code
#oxygen mono
#space mono
