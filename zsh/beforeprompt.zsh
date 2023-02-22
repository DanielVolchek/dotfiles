# everything that needs to happen before instantprompt is loading
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.  
#

# automatically open tmux
# only triggers if not in tmux already
if ! tmux info &> /dev/null; then 
  # if tmux server exists reattach else create new session to allow for tmux restore
  tmux attach || tmux new
fi
