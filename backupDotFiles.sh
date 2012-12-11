#!/bin/bash
mkdir ~/.git-dotfile
cd ~/.git-dotfile

git init

mv   ~/.vim        `pwd`/vim
mv   ~/.vimrc      `pwd`/vimrc
mv   ~/.tmux.conf  `pwd`/tmux.conf
mv   ~/.profile    `pwd`/profile
mv   ~/.bashrc     `pwd`/bashrc

echo "init:" >> Makefile
echo -e "\t\tln -fs `pwd`/vim ~/.vim" >> Makefile
echo -e "\t\tln -fs `pwd`/vimrc ~/.vimrc" >> Makefile
echo -e "\t\tln -fs `pwd`/tmux.conf ~/.tmux.conf" >> Makefile
echo -e "\t\tln -fs `pwd`/profile ~/.profile" >> Makefile
echo -e "\t\tln -fs `pwd`/bashrc ~/.bashrc" >> Makefile

# initialize your dotfile env
make init
# do github-import ? :p

