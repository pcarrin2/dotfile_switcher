#!/usr/bin/zsh

distro_dir=~/.dotfile_switcher/$(hostname)

for f in $distro_dir/.*
{
    ln -fs $f ~/$(basename $f)
}
