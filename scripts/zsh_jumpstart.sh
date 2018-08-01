#!/usr/bin/env bash
#
# A zsh with oh-my-zsh and custom setup jump start script (this is for container use, running Ubuntu)
# (bonus with neofetch)

sudo apt-get install neofetch

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installing antigen
curl -L git.io/antigen > antigen.zsh

# Downloading personal repo
wget https://github.com/Anarcroth/dotfiles/archive/master.zip
unzip dotfiles
cp dotfiles/shell/.zshrc_container ~/.zshrc

wget https://github.com/denysdovhan/spaceship-prompt/archive/master.zip && unzip spaceship-prompt -d  $ZSH_CUSTOM/themes/spaceship-prompt

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
