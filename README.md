# dotfile_switcher
*Switch out dotfiles between multiple Linux distributions sharing a ~ directory.*

To save space when dual-booting multiple Linux distros (or Linux and MacOS), you might want to let your systems share a home partition. But sharing directories like .config or .local will result in overwriting/loss of configuration files. This repo lets you put system-specific dotfiles in their own hidden directory and then expose them to the correct distro at boot. Unlike conventional dotfile managers, `dotfile_switcher` doesn't automatically create backups or a Git repository of your files. This makes it very lightweight compared to solutions like `yadm`.

This repository requires zsh, and setup requires root privileges to enable the startup/shutdown systemd services.

## Installation and Setup
Clone the repository:
```
git clone https://github.com/pcarrin2/dotfile_switcher
```

Then run install.sh:
```
cd dotfile_switcher
./install.sh
```

Now you'll need to move system-specific dotfiles into `~/.dotfile_switcher/$(hostname)/`. You can do this manually, or you can write a newline-delimited list of files in `~` to `~/.dotfile_switcher/$(hostname)/dot_list.conf`. Then run `~/.dotfile_switcher/move_into_managed_dir.sh` to move each of these files and then symlink them back to `~`.

Finally, for each other system that shares `~`, clone this repo, run `./install.sh`, and add relevant dotfiles again.

## Usage
To add a new dotfile, run:
```
mv ~/.my_dotfile ~/.dotfile_switcher/$(hostname)/ && ln -s ~/.dotfile_switcher/$(hostname)/.my_dotfile ~
```
It is not necessary to add this file to `dot_list.conf`.

To create a backup of a system's dotfiles, a quick-and-dirty solution is 
```
cd ~/.dotfile_switcher/$(hostname)/
tar -czvf backup.tar.gz ./.*
```
And to restore from this backup, simply unpack it with `tar -xzf backup.tar.gz`.

