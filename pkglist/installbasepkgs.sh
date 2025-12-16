#!/bin/bash 

echo -e "\n\x1b[32mInstalling the critical packages..."
pacman -S --noconfirm --needed - < basepkgs.txt
