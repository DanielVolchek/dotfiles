# Setup fzf
# ---------
# silicon binds
if [[ $ENV == "HOME" ]]; then
  if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
  fi

  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

  # Key bindings
  # ------------
  # silicon bindings
  source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
  #intel bindings
else
# intel binds
  # Setup fzf
# ---------
  if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
  fi

  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

  # Key bindings
  # ------------
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi
