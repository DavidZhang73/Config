#!/bin/sh

CURRENT_DIR=$(cd $(dirname $0); pwd) && \

echo "******************** Install basic vimrc *************************" && \
wget https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim -O ~/.vimrc
