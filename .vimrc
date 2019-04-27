" Go to lines with `==>` and make changes if needed

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin


"set diffexpr=MyDiff()
"function MyDiff()
  "let opt = '-a --binary '
  "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  "let arg1 = v:fname_in
  "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  "let arg2 = v:fname_new
  "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  "let arg3 = v:fname_out
  "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  "if $VIMRUNTIME =~ ' '
    "if &sh =~ '\<cmd'
      "if empty(&shellxquote)
        "let l:shxq_sav = ''
        "set shellxquote&
      "endif
      "let cmd = '"' . $VIMRUNTIME . '\diff"'
    "else
      "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "endif
  "else
    "let cmd = $VIMRUNTIME . '\diff'
  "endif
  "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  "if exists('l:shxq_sav')
    "let &shellxquote=l:shxq_sav
  "endif
"endfunction

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" ##################################
" #         Vundle Setting         #
" ##################################
set nocompatible              " be improved, required
filetype off                  " required

set path+=**

" set the runtime path to include Vundle and initialize
" ******The vundle plugin path
" ==> Path of the plugin manager Vundle.
set rtp+=/home/wenfeng/software/vim/bundle/Vundle.vim     
" ******Using the default path to install plugins
" call vundle#begin()                        
" ******Or, pass a path where Vundle should install plugins
" ==> Directory to install the plugin
call vundle#begin('/home/wenfeng/software/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" *****(1)plugin on GitHub repo: username/pluginname
Plugin 'endel/vim-github-colorscheme'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/MatlabFilesEdition'
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'ternjs/tern_for_vim'
Plugin 'tpope/vim-repeat'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Valloric/YouCompleteMe'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'Shougo/deol.nvim'
Plugin 'Yggdroot/indentLine'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'


" *****(2)plugin from http://vim-scripts.org/vim/scripts.html: name only
Plugin 'L9'
Plugin 'pep8'

" *****(3)Git plugin not hosted on GitHub

" *****(4)git repos on your local machine (i.e. when working on your own plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" ##################################
" #           GUI Setting          #
" ##################################
"set guifont=Consolas:h14:cANSI
if has('gui_running')
	autocmd GUIEnter * set vb t_vb=
	autocmd FileType python setlocal completeopt-=preview
	set lines=999 columns=999
	set guioptions-=T
	set guioptions-=m
	set background=light
else
	set background=dark
endif

set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" set guifont=Courier\ New:h14
set guifont=Monospace\ 12
set shiftwidth=4
set tabstop=4	
set autoindent
set smartindent
set number
syntax enable
colorscheme solarized
" ==> startup directory
exec 'cd ' . fnameescape('~/vim-files')

" ##################################
" #         Plugin Setting         #
" ##################################
" for Syntastic Pluin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E501,E226'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']
" For vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
" For tagbar
let g:tagbar_ctags_bin = 'D:\software\Vim\vimfiles\bundle\tagbar\ctags\ctags.exe'
let g:tagbar_autoclose = 0
" For vim-markdown
let vim_markdown_preview_hotkey='<C-m>'
" For jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#force_py_version = 3

" ==> YCM configuration file and python path
"For YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"let g:ycm_python_binary_path='~/miniconda3/envs/py36/bin/python'
let g:ycm_autoclose_preview_window_after_completion=1
"For indent
let g:indentLine_char='┆'
let g:indentLine_enabled=1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" concatenate string
" ==> for python support
let $PATH="/home/wenfeng/miniconda3/envs/py36/bin:".$PATH

" ##################################
" #         Key Mapping            #
" ##################################
let mapleader = ','

" navigate buffers
map <Leader>n <ESC>:bnext<CR>
map <Leader>p <ESC>:bprevious<CR>

:imap jj <ESC>

:nmap <F9> :w<Esc>:!python3 %<CR>
:nmap <F7> :w<Esc>:!gcc % && a<CR>

:vmap <F9> !python<CR>

:tnoremap <ESC> <C-\><C-N>
