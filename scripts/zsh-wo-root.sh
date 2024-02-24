#!/bin/sh
set -e

cd $HOME
PREFIX=$HOME/.local
NCURSES_VERSION=6.3
ZSH_VERSION=5.8.1

echo "******************** Download *************************"
mkdir -p download
cd download
wget https://invisible-island.net/datafiles/release/ncurses.tar.gz -O ncurses.tar.gz
tar -xvzf ncurses.tar.gz
wget https://sourceforge.net/projects/zsh/files/zsh/$ZSH_VERSION/zsh-$ZSH_VERSION.tar.xz/download -O zsh.tar.xz
tar -xf zsh.tar.xz

echo "******************** Install ncurses *************************"
cd ncurses-$NCURSES_VERSION
export CXXFLAGS=" -fPIC"
export CFLAGS=" -fPIC"
./configure --prefix=$PREFIX --enable-shared
make
make install

echo "******************** Install zsh *************************"
cd ../zsh-$ZSH_VERSION
INSTALLATION_PATH=$PREFIX
export PATH=$INSTALLATION_PATH/bin/:$PATH
export LD_LIBRARY_PATH=$INSTALLATION_PATH/lib:$LD_LIBRARY_PATH
export CFLAGS=-I$INSTALLATION_PATH/include
export CPPFLAGS="-I$INSTALLATION_PATH/include"
export LDFLAGS="-L$INSTALLATION_PATH/lib"
./configure --prefix=$PREFIX --enable-shared
make
make install

echo "******************** Install zsh *************************"
cd $HOME
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
echo '[ -f $HOME/.local/bin/zsh ] && exec $HOME/.local/bin/zsh -l' >> ~/.profile

echo "******************** Install oh-my-zsh *************************"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

echo "******************** Install zsh-autosuggestions *************************"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "******************** Install zsh-syntax-highlighting *************************"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "******************** Install zsh-completions *************************"
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

echo "******************** Config oh-my-zsh *************************"
wget https://raw.githubusercontent.com/DavidZhang73/Config/master/dotfiles/.dircolors -O ~/.dircolors
wget https://raw.githubusercontent.com/DavidZhang73/Config/master/dotfiles/.zshrc -O ~/.zshrc

echo "******************** Finish *************************"
zsh
