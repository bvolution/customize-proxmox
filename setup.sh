#!/bin/bash

# Check if both username and email are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <email>"
    exit 1
fi

echo "===== Setup for Customization of Proxmox ====="

apt-get update
apt-get -y install nala
# Install nala package manager 
nala update
nala -y upgrade
nala install -y neovim git

# Set Git global configuration
git config --global user.name "$1"
git config --global user.email "$2"

# Display the updated Git global configuration
echo "Git global configuration updated:"
echo "User Name: $(git config --global user.name)"
echo "User Email: $(git config --global user.email)"

echo "Instsalling color theme: oh my bash"
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

# Customize nvim
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/
echo "alias nv=nvim" >> ~/.bashrc

# Installing plugin manager for nvim
 curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
