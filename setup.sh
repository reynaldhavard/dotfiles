#!/bin/sh

# Delete previous versions
rm -rf ~/.config/nvim ~/.bashrc ~/.tmux.conf ~/.zshrc

# Create symlinks
SCRIPT_DIR=$(dirname $(readlink -f $0))
ln -s ${SCRIPT_DIR}/nvim ~/.config/nvim
ln -s ${SCRIPT_DIR}/.bashrc ~/.bashrc
ln -s ${SCRIPT_DIR}/.tmux.conf ~/.tmux.conf
ln -s ${SCRIPT_DIR}/.zshrc ~/.zshrc
