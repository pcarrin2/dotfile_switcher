#!/usr/bin/zsh
distro_dir=$(hostname)

typeset -a dotfiles=("${(f)"$(<~/.dotfile_switcher/$distro_dir/dot_list.conf)"}")

for f in $dotfiles
{
    mv ~/$f ~/.dotfile_switcher/$distro_dir/
    ln -fs ~/.dotfile_switcher/$distro_dir/$f ~/$f
}
