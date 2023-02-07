#!/usr/bin/zsh

# add current username to User= and Group= lines of service files
sed -i 's/^User=$/User='"$(whoami)"'/;s/^Group=$/Group='"$(whoami)"'/' *.service

chmod u+x *.sh

mkdir ~/.dotfile_switcher
cp shutdown.sh ~/.dotfile_switcher
cp startup.sh ~/.dotfile_switcher
cp move_into_managed_dir.sh ~/.dotfile_switcher

cd ~/.dotfile_switcher
mkdir $(hostname)
touch $(hostname)/dot_list.conf
mkdir other-hostname
touch other-hostname/dot_list.conf

cd -
echo "Copying .service files where systemd can see them..."
sudo cp *.service /etc/systemd/system/

echo "Initial setup is complete."
echo "To complete the setup process, write a newline-delimited list of system-specific dotfiles to ~/.dotfile_switcher/$(hostname)/dot_list.conf, then run ~/.dotfile_switcher/move_into_managed_dir.sh."
echo "Next, create a new directory in ~/.dotfile_switcher for each system that shares this ~ dir. Move system-specific dotfiles into these directories."
echo "Finally, please enable link-dotfiles.service and unlink-dotfiles.service, and copy these .service files to any other systems sharing ~."
