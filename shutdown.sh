#!/usr/bin/zsh

distro_dir=~/.dotfile_switcher/$(hostname)

for f in $distro_dir/.*
{
    if [[ -h ~/$(basename $f) ]]
    then
        unlink ~/$(basename $f)
    fi
}
