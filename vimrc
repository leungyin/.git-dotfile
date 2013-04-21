"instruction for me
"
"ctrl+w < #mutil windows
"ctrl+w >
"ctrl+w h/j/k/l
"ctrl+w -
"ctrl+w +
"
"<leader>o
"<leader>i tabular
"<F7>
"<F8>
"1. % va}Ok
"2. [[ ]]
"3. '' last location
"4. mx
"5. `x
"6. >>
"7. <<
"8. '. last edit
"9. Fx Tx fx tx
"10. * # search
"11. colorscheme
"12. bd 一次关闭多个窗口
"13. ctrl + o / ctrl + i 上次的位置，可以多次会退
"14. z+. 让当前编辑行位于屏幕中央 z+<Enter> 让当前编辑行位于屏幕上端
"15. 选择 vi" va" vi] va] v2i) v2a)
"16. mutiTab gt gT :tabedit :tabmove :tabnew
"17. gD 跳到局部变量的定义处
"map <leader>n :NERDTree<CR>
"<F8> taglist
"nmap <leader>o :CommandT<CR>
"map <leader>i :Tab/
"map <leader>m :MRU<CR>
"
"
"
"



""""""""""""""""""""""
"some skills
""""""""""""""""""""""

"replace \ which is default value of leader  with ,
let mapleader=","
"insert a blank line before this line
map tt O<Esc>j
"use ; replace with :, you can hit keyboard more quickly
nnoremap ; :
"change word to uppercase, I love this very much
inoremap <C-u> <esc>gUiwea
"rehardwrap paragraphs of text
nnoremap <leader>q gqip
"Kill window
nnoremap K :wq!<cr>
"use ZZ replace K

"quickly moving from insert mode to normal mode
vnoremap u <nop>
vnoremap gu u
"Keep the cursor in place while joining limes
nnoremap J mzJ'z
"strip all trailing whitespace in the current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
inoremap jj <Esc>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%



""""""""""""""""""""""
"select
""""""""""""""""""""""
"reselect the text that was just pasted
nnoremap <leader>V V`]
"select all texts
nnoremap <leader>v ggvG$
"Select the contents of the current line, excluding indentation.
nnoremap vv ^vg_



""""""""""""""""""""""
"move
""""""""""""""""""""""
"find next char
noremap <CR> ;

inoremap <C-a> <ESC>I
inoremap <C-e> <ESC>A
nnoremap gg mzgg
nnoremap G mzG
nnoremap j gj
nnoremap k gk



""""""""""""""""""""""
"working with split windows and tabs
""""""""""""""""""""""
"open a new vertical split and switch over to it.
nnoremap <leader>sp <C-w>v<C-w>l
"quickly open up my /.vimrc file in a vertically
nnoremap <leader>ev <C-w><C-v>:	e $MYVIMRC<cr>

"switch between panels
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-o> <C-w>o
"map <C-r> <C-w>r
map <C-=> <C-w>=
map <C-left> <C-w>+
map <C-right> <C-w>-

"switch between windows
map <S-h> <C-pageUp>
map <S-l> <C-pagedown>

map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
"
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/



""""""""""""""""""""""
"system clipboard interaction
""""""""""""""""""""""
noremap <leader>y "+y
vnoremap <leader>y "+y
vnoremap <leader>p "+p
noremap <leader>p "+p


""""""""""""""""""""""
"tab setting
""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab



""""""""""""""""""""""
"set fold
""""""""""""""""""""""
map <space> zi
set foldmethod=indent



""""""""""""""""""""""
"a few options that just make things better and other settings
"http://stevelosh.com/blog/2010/09/coming-home-to-vim
""""""""""""""""""""""
set listchars=tab:\ \ ,trail:.
set encoding=utf-8
"Set Unix as the standard encoding and en_US as the Standard language
set ffs=unix,dos,mac
set scrolloff=3 "how many lines to boundary
set autoindent
"set to auto read when a file is changed from the outside
set autoread
"set smartindent
set showmode
set showcmd "回显输入的命令
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline " highlight line under cursor
set ttyfast
"always dispaly the postion of cursor
set ruler
set backspace=indent,eol,start "解除Backspace 的限制
set laststatus=2
set relativenumber " relativenumber
set undofile "undo file
"Ignore compiled files
set wildignore=*.o,*~,*.prc
"Don't redraw while executing macros
set lazyredraw
"get rid of all the crap that vim does to be vi compatible
set nocompatible
"prevents some security exploits
set modelines=0

"No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Enable filetype plugins
filetype plugin on
filetype indent on
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936
set completeopt=longest,menu



""""""""""""""""""""""
"backup
""""""""""""""""""""""
set backup
set noswapfile
set undodir=~/.vim/tmp/undo/  "undo files
set backupdir=~/.vim/tmp/backup/  "backups
set directory=~/.vim/tmp/swap/  "swap files
"au FocusLost * :wa



""""""""""""""""""""""
"The next thing I do is tame searching/moving
""""""""""""""""""""""
set ignorecase "make vim deal with case-sensitive search intelligently.
set smartcase
set gdefault "apply subsititutions globally on lines.
set incsearch "highlight search results.
"Show matching brackets when text indicator is over them
set showmatch
"How many tehths of a second to blink when matching brackets
set mat=2
set hlsearch
"noh clear highlight  just type: ,<space>
nnoremap <leader><space> :noh<cr>



""""""""""""""""""""""
"show a colored column at 85 characters
"makes vim handle long lines correctly
""""""""""""""""""""""
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set autowrite



""""""""""""""""""""""
"disable the arrow keys and <F1>
""""""""""""""""""""""
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
""
""inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
" make <f1> nop
imap <F1> <ESC>
nmap <F1> <ESC>
cmap <F1> <ESC>
vmap <F1> <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>



""""""""""""""""""""""
" Buffer
""""""""""""""""""""""
map <leader>bd :Bclose<CR> "close the current buffer
map <leader>ba :1,1000 bd!<CR> "close the current buffer



""""""""""""""""""""""
" The c program language
""""""""""""""""""""""
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case,typedef,define,include
set formatoptions=tcqr
set cindent
syntax on
syntax enable



""""""""""""""""""""""
"colors
""""""""""""""""""""""
"colorscheme lmx
colorscheme molokai
set t_Co=256
"set background=dark



""""""""""""""""""""""
"frame
""""""""""""""""""""""
ab fu  #include "apue.h"<Enter><Enter>int main(int argc, char* argv[])<Enter>{<Enter>exit(0);<Enter>}<Esc>
"c框架frame
ab fc  #include <stdio.h><Enter><Enter>int main(int argc, char* argv[])<Enter>{<Enter><Tab>return 0;<Enter>}<ESC>
"c++框架frame
ab fcpp  #include <iostream><Enter>using namespace std;<Enter><Enter>int main(int argc, char* argv[])<Enter>{<Enter><Tab>return 0;<Enter>}<Esc>
"设置文件头<Enter> = <CR>
"map <F8> ggO/*<CR>* Copyright(c) Computer Science Department of XiaMen University <CR>*<CR>* Authored by lalor on:<Esc>:read !date <CR>kJ$a<CR>*<CR>* Email: mingxinglai(at)gmail.com<CR>*<CR>* @desc:<CR>*<CR>* @history<CR>*/<Esc>
"设置函数头
"map <F9> O/*<CR>* Copyright(c) Computer Science Department of XiaMen University <CR>*<CR>* Authored by lalor on:<Esc>:read !date <CR>kJ$a<CR>*<CR>* Function name:<CR>*<CR>* Utility:<CR>*<CR>* Input arguments:<CR>*<CR>* Output arguments:<CR>*/<Esc>



""""""""""""""""""""""
"reset statusline
""""""""""""""""""""""
if has("statusline")
set statusline+=%F%m%r%h%w\ %=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
endif




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""plugin""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""
"ctags & taglist
""""""""""""""""""""""
" Use ctrl+] go to defination of functions or variants
" Use ctrl+T go back previous position
" :help usr_29.txt "you can use this command to get help
set tags=tags;
set autochdir
" taglist
" :help taglist.txt
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=0
let Tlist_Sort_Type='name'
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=20
let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_WinHeight=10
let Tlist_WinWidth=33
let Tlist_Use_Horiz_Window=0
map <silent><leader>tl :TlistToggle<CR>
map <F8> :Tlist<CR>



""""""""""""""""""""""
" miniBufExp
""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1



""""""""""""""""""""""
" rain_bow_parenthese.vim
""""""""""""""""""""""
"自动加载 Rain_bow_parenthese 插件
au Syntax *  RainbowParenthesesToggleAll
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0



""""""""""""""""""""""
" doxygenToolkit
""""""""""""""""""""""
"这样就不用每次需要输入作者的名字了
let g:DoxygenToolkit_authorName="Mingxing LAI"
let g:DoxygenToolkit_brifTag_funcName="yes"
"let g:DoxygenToolkit_blockHeader="---------------"
"let g:DoxygenToolkit_blockFooter="---------------"

map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc O/* */<Left><Left>
map <leader>dl :DoxBlock<CR>



""""""""""""""""""""""
" mru.vim
""""""""""""""""""""""
let MRU_Exclude_Files='.*\.vim$'
map <leader>m :MRU<CR>




""""""""""""""""""""""
" Calendar.vim
""""""""""""""""""""""
map ca :CalendarH<Cr>
let g:calendar_diary="~/.diary"



""""""""""""""""""""""
" Tabular.vim
""""""""""""""""""""""
nmap <Leader>i :Tab /
nmap <Leader>i= :Tab /=<CR>
vmap <Leader>i= :Tab /=<CR>
nmap <Leader>i: :Tab /:\zs<CR>
vmap <Leader>i: :Tab /:\zs<CR>



""""""""""""""""""""""
" Powerline.vim
""""""""""""""""""""""
let t_Co=256
set laststatus=2
let g:Powerline_symbols='unicode'
let g:Powerline_colorscheme='skwp'



""""""""""""""""""""""
" NERDTree.vim
""""""""""""""""""""""
map <F10> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=0




""""""""""""""""""""""
" Yankring.vim
""""""""""""""""""""""
"ctrl + p
"ctrl + n
nnoremap <leader>y :YRShow<CR>
let g:yankring_history_file = '.my_yankring_history_file'



""""""""""""""""""""""
" SrcExpl
""""""""""""""""""""""
nmap <F9> :SrcExplToggle<CR> 
let g:SrcExpl_winHeight = 8 
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_jumpKey = "<ENTER>" 
let g:SrcExpl_gobackKey = "<SPACE>" 

"In order to Avoid conflicts, the Source Explorer should know what plugins 
"are using buffers. And you need add their bufname into the list below 
"according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
        \ "__Tag_List__", 
		\ "__MRU_Files__",
		\ "NERD_tree_1",
		\ "-MiniBufExplorer-",
        \ "_NERD_tree_", 
        \ "Source_Explorer" 
    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 
let g:SrcExpl_isUpdateTags = 0 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

"Set "<F12>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<F13>" 



""""""""""""""""""""""
" ctrlp.vim
""""""""""""""""""""""
let g:ctrlp_map = '<c-m>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode='ra'
"Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"Press <c-f> and <c-b> to cycle between modes.
"Press <c-d> to switch to filename only search instead of full path.
"Press <c-r> to switch to regexp mode.
"Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"Use <c-y> to create a new file and its parent directories.
"Use <c-z> to mark/unmark multiple files and <c-o> to open them.


""""""""""""""""""""""
" EasyMotion
""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Leader>'



""""""""""""""""""""""
" nerd_commenter
""""""""""""""""""""""
""[count]<leader>cc |NERDComComment| 
""Comment out the current line or text selected in visual mode. 
""
""
""[count]<leader>cn |NERDComNestedComment| 
""Same as <leader>cc but forces nesting. 
""
""
""[count]<leader>c<space> |NERDComToggleComment| 
""Toggles the comment state of the selected line(s). If the topmost selected 
""line is commented, all selected lines are uncommented and vice versa. 
""
""
""[count]<leader>cm |NERDComMinimalComment| 
""Comments the given lines using only one set of multipart delimiters. 
""
""
""[count]<leader>ci |NERDComInvertComment| 
""Toggles the comment state of the selected line(s) individually. 
""
""
""[count]<leader>cs |NERDComSexyComment| 
""Comments out the selected lines ``sexily'' 
""
""
""[count]<leader>cy |NERDComYankComment| 
""Same as <leader>cc except that the commented line(s) are yanked first. 
""
""
""<leader>c$ |NERDComEOLComment| 
""Comments the current line from the cursor to the end of line. 
""
""
""<leader>cA |NERDComAppendComment| 
""Adds comment delimiters to the end of line and goes into insert mode between 
""them. 
""
""
""|NERDComInsertComment| 
""Adds comment delimiters at the current cursor position and inserts between. 
""Disabled by default. 
""
""
""<leader>ca |NERDComAltDelim| 
""Switches to the alternative set of delimiters. 
""
""
""[count]<leader>cl 
""[count]<leader>cb    |NERDComAlignedComment| 
""Same as |NERDComComment| except that the delimiters are aligned down the 
""left side (<leader>cl) or both sides (<leader>cb). 
""
""
""[count]<leader>cu |NERDComUncommentLine| 
""Uncomments the selected line(s). 



""""""""""""""""""""""
" Pydoc
""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Leader>'
