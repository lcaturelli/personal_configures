XKBOPTIONS=ctrl:nocaps >> /etc/default/keyboard

# zsh configure
$ZSH_CUSTOM
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
sudo cp -r  settings.json ~/.config/Code/User/settings.json
sudo cp -r  .spacemacs ~/.spacemacs
sudo cp -r  surfingkeys-config-ko.js ~/.surfingkeys-config-ko.js
sudo cp -r  .zshrc ~/.zshrc
sudo cp -r  .ideavimrc ~/.ideavimrc

source ~/.zshrc
source ~/.ideavimrc

./vscode_installed_extensions.sh
sudo vim -c 'PluginInstall' -c 'qa!'

# function key behavior change like window
sudo su -c "echo -n 0x02 > /sys/module/hid_apple/parameters/fnmode"

# function key behavior change like window permanently
sudo echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all

# keyboard setting
xmodmap Xmodmap

# taskbar setting
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

# spacemacs plugins install automatically
emacs README.md


