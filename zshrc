#关于历史纪录的配置
#历史记录条目数量
export HISTSIZE=10000

#注销后保存的历史记录条目数量
export SAVEHIST=10000

# 历史记录文件
export HISTFILE=~/.zhistory

#以附加的方式写入历史记录
setopt INC_APPEND_HISTORY

#为历史记录中的命令添加时间戳
setopt EXTENDED_HISTORY

#启用cd 命令的历史记录 cd -[tab]进入历史路劲
setopt AUTO_PUSHD

#相同的历史路径只保留一份
setopt PUSHDIGNORE_DUPS

#在命令前添加空格，不将此命令添加到记录文件
setopt HISTIGNORESPACE

#禁用core dumps
limit coredumpsize 0

#Emacs风格键绑定
bindkey -e
#设置DEL键为向后删除
bindkey "\e[3~" delete-char

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU

#开启此选项，补全时会直接选中菜单项
#setopt MENU_COMPLETE

autoload -U compinit
compinit

#自动补全缓存
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

# 自动补全选项
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

##路径补全
zstyle ':completion:*' expand 'no'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#kill 命令补全
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# 补全类型提示分组
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'


#alias
source ~/.alias


#路径别名 进入相应的路径时只要 cd ~xxx
hash -d cn="/home/lalor/github/cn"
hash -d d="/home/lalor/download"
hash -d p="/home/lalor/note/public"
hash -d post="/home/lalor/code/postgresql-7.4.30/src/backend/storage/buffer"
hash -d E="/etc/env.d"
hash -d C="/etc/conf.d"
hash -d I="/etc/rc.d"
hash -d X="/etc/X11"
hash -d note="/home/lalor/note"

set JAVA_HOME=/usr/java/jdk1.6.0_38
set CLASSPATH=.:$JAVA_HOME:/lib/tools.jar:/lib.dt.jar
set PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME CLASSPATH PATH

#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' 

if [ "$TERM" = "linux" ]; then
	echo -en "\e]P0222222" #black
	echo -en "\e]P8222222" #darkgrey
	echo -en "\e]P1803232" #darkred
	echo -en "\e]P9982b2b" #red
	echo -en "\e]P25b762f" #darkgreen
	echo -en "\e]PA89b83f" #green
	echo -en "\e]P3aa9943" #brown
	echo -en "\e]PBefef60" #yellow
	echo -en "\e]P4324c80" #darkblue
	echo -en "\e]PC2b4f98" #blue
	echo -en "\e]P5706c9a" #darkmagenta
	echo -en "\e]PD826ab1" #magenta
	echo -en "\e]P692b19e" #darkcyan
	echo -en "\e]PEa1cdcd" #cyan
	echo -en "\e]P7ffffff" #lightgrey
	echo -en "\e]PFdedede" #white
	clear #for background artifacting
fi

#make man page colorful
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


#该函数的功能是不输入任何内容的情况下，按回车执行ls命令
user-ret(){
	if [[ $BUFFER = "" ]] ;then
		BUFFER="ls"
		zle end-of-line
		zle accept-line
	elif [[ $BUFFER =~ "^cd\ \.\.\.+$" ]] ;then
		BUFFER=${${BUFFER//\./\.\.\/}/\.\.\//}
		zle end-of-line
		zle accept-line
	else
		zle accept-line
	fi
}
zle -N user-ret
bindkey "\r" user-ret

#该函数的功能是在不输入任何内容的情况下按Tab自动输入cd 
user-complete(){
	if [[ -n $BUFFER ]] ; then     # 如果该行有内容
		zle expand-or-complete    # 执行 TAB 原来的功能
	else                                  # 如果没有
		BUFFER="cd "                 # 填入 cd（空格）
		zle end-of-line                # 这时光标在行首，移动到行末
		#zle expand-or-complete    # 执行 TAB 原来的功能
	fi
}
zle -N user-complete
bindkey "\t" user-complete        #将上面的功能绑定到 TAB 键

#按两下ESC,用管理员权限执行上一条命令
sudo-command-line()
{
	[[ -z $BUFFER ]] && zle up-history
	[[ $BUFFER != sudo\* ]] && BUFFER="sudo $BUFFER"

	zle end-of-line
}

zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

#按Ctrl+b 将光标移到行首
go-to-begin(){
	zle beginning-of-line
}

zle -N go-to-begin
bindkey "^b" go-to-begin

#
# ZSH Theme - Preview: http://dl.dropbox.com/u/4109351/pics/gnzh-zsh-theme.png
# Based on bira theme

# load some modules
autoload -U colors zsh/terminfo # Used in the colour alias below
colors
setopt prompt_subst

# make some aliases for the colours: (coud use normal escap.seq's too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

# Check the UID
if [[ $UID -ge 1000 ]]; then # normal user
	eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
	eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
	local PR_PROMPT='$PR_NO_COLOR➤ $PR_NO_COLOR'
elif [[ $UID -eq 0 ]]; then # root
	eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
	eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
	local PR_PROMPT='$PR_RED➤ $PR_NO_COLOR'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
	eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
else
	eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' # no SSH
fi

local return_code="%(?..%{$PR_RED%}%? ↵%{$PR_NO_COLOR%})"

local user_host='${PR_USER}${PR_RED}@${PR_HOST}'
local current_dir='%{$PR_BOLD$PR_BLUE%}%~%{$PR_NO_COLOR%}'
local sun='${PR_YELLOW}✹ ${PR_NO_COLOR}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
	rvm_ruby='%{$PR_RED%}‹$(rvm-prompt i v g s)›%{$PR_NO_COLOR%}'
else
	if which rbenv &> /dev/null; then
		rvm_ruby='%{$PR_RED%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$PR_NO_COLOR%}'
	fi
fi
#local git_branch='$(git_prompt_info)%{$PR_NO_COLOR%}'

#PROMPT="${user_host} ${current_dir} ${rvm_ruby} ${git_branch}$PR_PROMPT "
PROMPT="${sun}╭──${user_host} ${current_dir} ${rvm_ruby} 
${sun}╰──$PR_PROMPT"
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$PR_YELLOW%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$PR_NO_COLOR%}"


#    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
#    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
#    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
#    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
#    ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
#    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
