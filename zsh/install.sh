#!/bin/bash
#start interactive so script can be sourced at the end

echo "Starting ZSH install script"
echo "WARN: This script will overwrite zsh files... Continue? (y/n)"
read -r response
if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  echo "Exiting..."
  exit 1
fi

echo "Continuing..."

# get directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# link all files in this directory to home directory

# pretty sure there is a better way to do this

echo "linking .zsh files"

BASE=$(find $DIR -maxdepth 1 -type f -name '*.zsh' -exec basename {} ';')
for file in $BASE; do
  hidden=$(echo $file | sed 's/^/./')
  echo "linking $file to $HOME/$hidden"
  # echo $DIR/$file
  ln -sf $DIR/$file $HOME/$hidden
done

echo "linking zshrc"
ln -sf $DIR/zshrc $HOME/.zshrc
echo "linking essential dirs"
echo "linking pl10k"
ln -sf $DIR/powerlevel10k $HOME/powerlevel10k
echo "linking ohmyzsh"
ln -sf $DIR/oh-my-zsh $HOME/.oh-my-zsh

# if zsh-autocompletion inside of $ZSH_CUSTOM already then skip
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "linking zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi


echo "Restart terminal or source $HOME/.zshrc to see changes"
