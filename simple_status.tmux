#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Colors
foreground="#dad7cf"
foreground_dark="#626975"

background="#6c5980"
background_dark="#1f222a"

highlight="#d95757"

# Components
session_number="#[bg=${background},fg=${foreground}] #S "
username="#[bg=${background_dark},fg=${foreground}] #(whoami) "

inactive_window="#[bg=${background_dark},fg=${foreground_dark}] #I #W "
active_window="#[bg=${highlight},fg=${foreground}] #I #W "

date_time="#[bg=${background},fg=${foreground}] %I:%M %p | %d %B %Y "

# Refresh time for the status line
tmux set -g status-interval 1

# Transparent background
tmux set -g status-style bg=default,fg=default

# Left status
tmux set -g status-left-length 50
tmux set -g status-left "${session_number}${username}"

# Window list
tmux setw -g window-status-format "${inactive_window}"
tmux setw -g window-status-current-format "${active_window}"
tmux setw -g window-status-separator ""

tmux set -g status-justify centre

# Left status
tmux set -g status-right "#(${CURRENT_DIR}/scripts/battery.sh)${date_time}"
