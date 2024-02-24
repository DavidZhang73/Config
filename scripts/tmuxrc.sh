#!/bin/sh
set -e

echo "******************** Install tmuxrc *************************"
wget https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf -O ~/.tmux.conf
wget https://raw.githubusercontent.com/gpakosz/.tmux/master/.tmux.conf.local -O ~/.tmux.conf.local
