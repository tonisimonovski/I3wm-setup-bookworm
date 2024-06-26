#!/usr/bin/env bash

# All in one install script of i3 windows manager on Debian Bookworm minimal
# install i3wm with --aditional pack

# Link to i3wm documentation: 
# https://i3wm.org/

============================================================================================================

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Install packages after installing base Debian with no GUI
============================================================================================================

# Update packages list 
apt update -y 

# and update system
apt upgrade -y

# Install nala
apt install nala -y

# xorg display server installation
apt install -y xorg xserver-xorg xbacklight xbindkeys xinput

# Install i3 windows manager
apt install i3

# i3lock --i3lock is a simple screen locker like slock. 
apt install -y i3lock

# build-essential If you do not plan to build Debian packages, you don't need this package. 
# apt install -y build-essential

# Tools/System
============================================================================================================
# dialog -  Displays user-friendly dialog boxes from shell scripts 
apt install -y dialog 
# acpi - displays information on ACPI devices 
apt install -y acpi 
# acpid - Advanced Configuration and Power Interface event daemon 
apt install -y acpid
systemctl enable acpid
# xfce4-power-manager - power manager for Xfce desktop
# apt install -y xfce4-power-manager 
# lxappearance - 	LXDE GTK+ theme switcher
apt install -y lxappearance 
# fastfetch - Shows Linux System Information with Distribution Logo 
apt install -y fastfetch
# btop - Modern and colorful command line resource monitor that shows usage and stats 
apt install -y btop
# avahi-daemon - The Avahi mDNS/DNS-SD daemon 
apt install -y avahi-daemon 
systemctl enable avahi-daemon

# Networking
============================================================================================================
# network-manager - network management framework (daemon and userspace tools) 
apt install -y network-manager
# network-manager-gnome - network management framework (GNOME frontend) 
apt install -y network-manager-gnome

# Accessories
============================================================================================================
# Thunar and accessories
apt install -y thunar thunar-archive-plugin thunar-volman file-roller
# Terminal (eg. terminator,kitty,xfce4-terminal)
# apt install -y zutty 
# Sound packages
apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pamixer


# Browser Installation (eg. chromium, brave, firefox-esr, librewolf)
============================================================================================================

git clone https://github.com/tonisimonovski/Install-Librewolf-in-Bookworm ~/Downloads/Librewolf

cd ~/Downloads/Librewolf

sudo chmod +x install_librewolf_in_Bookworm.sh

sudo ./install_librewolf_in_Bookworm.sh

sudo rm -r ~/Downloads/Librewolf

cd ~/


# Desktop background browser/handler (feh --bg-fill /path/to/directory )
apt install -y feh

### Installing fonts ###
============================================================================================================

# Fonts and icons 
apt install -y fonts-roboto 
apt install -y fonts-recommended 
apt install -y fonts-noto-color-emoji 
apt install -y fonts-ubuntu 
apt install -y fonts-font-awesome 
apt install -y fonts-terminus 

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls=exa -al --long --header --color=always --group-directories-first 
apt install -y exa


# bluetooth
apt install -y bluez blueman
systemctl enable bluetooth

### Packages needed for window manager installation ###
============================================================================================================

apt install -y picom        
apt install -y rofi
apt install -y dunst
apt install -y libnotify-bin
apt install -y unzip
apt install -y wmctrl
apt install -y xdotool
apt install -y libnotify-dev
# compton --Compton Compositor - Add Transparency To Your Programs
apt install -y compton
# xclip --Copy and paste at the Linux command line with xclip
apt install -y xclip
# qt5-style-plugins --Qt 5 extra widget styles, qt5-style-plugins
apt install -y qt5-style-plugins
# materia-gtk-theme --Materia. Materia is a Material Design theme for GNOME/GTK based desktop environments.
apt install -y materia-gtk-theme
# flameshot --Flameshot is a free and open-source, cross-platform tool to take screenshots
apt install -y flameshot
# pnmixer --PNMixer is a simple mixer application designed to run in your system tray.
apt install -y pnmixer
   
### Installing Essential Programs 
============================================================================================================
# lxpolkit 
apt install -y lxpolkit
# x11-xserver-utils 
apt install -y x11-xserver-utils
# wget 
apt install -y wget
# pipewire 
apt install -y pipewire
# wireplumber 
apt install -y wireplumber
# libx11-dev 
apt install -y libx11-dev
# libxft-dev 
apt install -y libxft-dev
# libxinerama-dev 
apt install -y libxinerama-dev
# libx11-xcb-dev 
apt install -y libx11-xcb-dev
# libxcb-res0-dev 
apt install -y libxcb-res0-dev
# zoxide
apt install -y zoxide
# Installing Other less important Programs
============================================================================================================
apt install -y psmisc 
apt install -y mangohud 
apt install -y lightdm

# Enable graphical login and change target from CLI to GUI
============================================================================================================
systemctl enable lightdm
systemctl set-default graphical.target
systemctl enable lightdm

# Enable wireplumber audio service
sudo -u $username systemctl --user enable wireplumber.service

# Multimedia/GFX
============================================================================================================
apt install -y vlc 
apt install -y qimgv 
# apt install -y scrot 
# apt install -y mkvtoolnix-gui 
apt install -y redshift 
apt install -y brightnessctl

# Others
apt install -y numlockx 
apt install -y figlet 
apt install -y galculator
apt install -y cpu-x
apt install -y udns-utils
apt install -y whois 
apt install -y curl 
apt install -y tree

============================================================================================================
# End of script #


apt autoremove

printf "\e[1;32mFinished! Thank you.\e[0m\n"
