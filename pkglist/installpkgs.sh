#!/usr/bin/env bash


# Install script for installing the required packages, useful for whenever you are moving into a different system with arch installed or if you are just simply reinstalling arch linux

# Author: Jojo


if [ "$EUID" -ne 0 ]; then
   echo -e "\x1b[31mIn order to run this script, root privileges are required (or with sudo)"
   exit 1
fi


echo -e "\nChecking if git and base-devel packages are installed..."
if [ ["pacman -Q git base-devel"] ]
then
    sleep 3
    echo -e "\x1b[32mgit and base-devel are installed, there's nothing to do"
else
    echo -e "\x1b[1;38;5;220mgit and base-devel packages are not installed on the system, installing..."
    pacman -S --noconfirm git base-devel
    echo -e "\n\x1b[32mgit and base-devel are installed"
fi


if [ ["pacman -Q yay"] ]
then
   sleep 2
   echo -e "\x1b[32myay package manager is present in the system"
   yay -Syu --noconfirm
   echo -e "\nSyncing the package database and upgrading the installed packages..."
   echo -e "\nInstalling the packages..."
   yay -S --needed - < pkgs.txt
else
   echo -e "\x1b[1;38;5;220myay package manager is not present in the system, installing it..."
   git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd .. && sudo rm -rf yay
   echo -e "\x1b[32mYay package manager is installed"
   echo -e "\nInstalling the packages..."
fi



