#!/bin/sh

# Delete previous versions
rm -rf ~/.config/nvim ~/.bashrc ~/.tmux.conf ~/.zshrc

# Create symlinks
ln -s $(pwd)/nvim ~/.config/nvim
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.zshrc ~/.zshrc
