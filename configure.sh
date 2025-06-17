#!/bin/bash
# automatic personal dotfiles config script
# made by: lant silva, 2025
# this was mostly intended to be used in xfce (but works normally in other desktop environments), and in distros based in arch or debian, so i didn't planned it to be useable in other distros, sorry :(
# WARNING: THIS IS A WORK IN PROGRESS, USE IT AT YOUR OWN RISK

DE=`echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]'` 

# detecting current installed system base
if command -v pacman &> /dev/null; then
    pkginstaller="sudo pacman -S --confirm"
elif command -v apt &> /dev/null; then
    pkginstaller="sudo apt install -y"
else
    echo "unsupported system, aborting."
    exit 1
fi

# installing programs
if [[ "$pkginstaller" = *apt* ]]; then
    sudo add-apt-repository ppa:mmstick76/alacritty
    $pkginstaller alacritty zsh rofi gtk2-engines-murrine neofetch
else
    $pkginstaller alacritty zsh rofi gtk-engine-murrine neofetch
fi

# installing the main theme
# this is mostly personal choice, as i really like Fausto-Korpsvart's tokyonight theme for gtk
cd /tmp 
git clone https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme.git && cd Tokyonight-GTK-Theme/themes
./install.sh
if [ $? -eq 0 ]; then
    echo "installing theme: done"
else
    echo "unexpected error while installing theme"
fi

# moving config files
cp alacritty/alacritty.toml $HOME/.config/alacritty
cp rofi $HOME/.config
chmod +x $HOME/.config/rofi/launchers/type-4/launcher.sh

# ignore commands if using another desktop other than xfce
if [[ "$DE" = *xfce* ]]; then
    #testing purposes
    echo user is using xfce

    #moves xfce custom css theme to its dir
    if [ ! -d "$HOME/.config/gtk-3.0" ]; then
        mkdir $HOME/.config/gtk-3.0
    fi
    mv gtk-3.0/gtk.css $HOME/.config

    # configure main personal keyboard hotkeys
    # rofi launcher
    xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>r" -n -t string -s "$HOME/.config/rofi/launchers/type-4/launcher.sh"

    # alacritty
    xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>Return" -n -t string -s "alacritty"
fi

# final step: installing oh my zsh
cd /tmp
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
./install.sh
mv zsh/.zshrc $HOME

echo done :D