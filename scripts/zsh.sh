#!/bin/sh

CURRENT_DIR=$(cd $(dirname $0); pwd) && \

echo "******************** Install zsh & git *************************" && \
sudo apt update && apt install zsh git -y && \

echo "******************** Install oh-my-zsh *************************" && \
sudo chmod +x $CURRENT_DIR/zsh-install.sh && sudo $CURRENT_DIR/zsh-install.sh --unattended && \

echo "******************** Config oh-my-zsh *************************" && \
sudo cp -f $CURRENT_DIR/../dotfiles/.dircolors ~/.dircolors && \
sudo cp -f $CURRENT_DIR/../dotfiles/.zshrc ~/.zshrc && \

echo "******************** Install zsh-autosuggestions *************************" && \
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \

echo "******************** Install zsh-syntax-highlighting *************************" && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
sudo chsh -s $(which zsh) && \

echo "******************** Finish *************************"