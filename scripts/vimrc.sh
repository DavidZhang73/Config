#!/bin/sh
set -e

echo "******************** Install basic vimrc *************************"
wget https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim -O ~/.vimrc
