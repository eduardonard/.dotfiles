#! /usr/bin/bash

HISTFILE=~/.zsh_history        # Define where the history will be stored
HISTSIZE=10000                 # Number of lines to keep in memory
SAVEHIST=10000                 # Number of lines to keep in the history file

setopt INC_APPEND_HISTORY       # Immediately append history to the history file
setopt SHARE_HISTORY            # Share history between sessions
