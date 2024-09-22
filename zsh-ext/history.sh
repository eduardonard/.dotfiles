#! /usr/bin/bash

HISTFILE=~/.zsh_history        # Define where the history will be stored
HISTSIZE=10000                 # Number of lines to keep in memory
SAVEHIST=10000                 # Number of lines to keep in the history file

setopt INC_APPEND_HISTORY       # Immediately append history to the history file
setopt SHARE_HISTORY            # Share history between sessions
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS