# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

#goagent
if [[ ! -d ~/.git-dotfile ]]; then
   echo ".git-dotfile not existss" 
else
    cd ~/.git-dotfile
#python `pwd`/goagent/local/proxy.py &
fi

cd ~


#brightness of screen
#prequisite: chmod 777 /sys/class/backlight/acpi_video0/brightness
#echo "500" > /sys/class/backlight/acpi_video0/brightness
