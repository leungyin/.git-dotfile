init:
	ln -fs `pwd`/vim ~/.vim
	ln -fs `pwd`/vimrc ~/.vimrc
	ln -fs `pwd`/tmux.conf ~/.tmux.conf
	ln -fs `pwd`/alias ~/.alias
	ln -fs `pwd`/profile ~/.profile
	ln -fs `pwd`/bashrc ~/.bashrc
	ln -fs `pwd`/zshrc ~/.zshrc
	ln -fs `pwd`/awesome ~/.config/awesome
	ln -fs `pwd`/gtkrc-2.0 ~/.gtkrc-2.0
	mkdir -p `pwd`/vim/tmp/undo
	mkdir -p `pwd`/vim/tmp/swap
	mkdir -p `pwd`/vim/tmp/backup
	sudo passwd root
	su
	apt-get install exuberant-ctags
	chsh -s `which zsh`
	apt-get install git
	apt-get install zsh
	apt-get install awesome
	apt-get install tmux
	apt-get install ranger
	apt-get install antiword
	apt-get install vim vim-gnome
	apt-get install gnome-tweak-tool
  

clear:
	rm -rf ~/.config/awesome
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	rm -rf ~/.tmux.conf
	rm -rf ~/.alias
	rm -rf ~/.profile
	rm -rf ~/.zshrc
	rm -rf ~/.bashrc


