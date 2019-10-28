#!/bin/bash
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
# For example, we just use `~/.config/nvim/dein` as installation directory
sh /tmp/installer.sh ~/.config/nvim/dein
