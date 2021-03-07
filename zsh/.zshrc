#! /bin/zsh

# ~/.zshrc
# Ash Bellett

# History:

# Location of history file:
HISTFILE=~/.cache/zsh/history
# Number of commands saved per session:
HISTSIZE=1024
# Number of commands saved overall:
SAVEHIST=1024
# Save timestamp and execution duration:
setopt EXTENDED_HISTORY
# Ignore duplicate commands:
setopt HIST_IGNORE_DUPS

# Completions:

# Load completions:
autoload -Uz compinit
# Start completions:
compinit
# Set completion style:
zstyle ':completion:*' menu select
# Auto-complete aliases:
setopt COMPLETE_ALIASES

# Prompt:

# Load prompt:
autoload -Uz promptinit
# Start prompt:
promptinit
# Define left prompt:
PROMPT='%B%n%b: %/ :: ' # boldface username
# Define right prompt:
#RPROMPT='%/' # current directory

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
