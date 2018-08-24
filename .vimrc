" Go to lines commented with --> and make changes if needed
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction




"*****Vundle Settings**************************"
set nocompatible              " be improved, required
filetype off                  " required

set path+=**

" set the runtime path to include Vundle and initialize
" ******The vundle plugin path
" --> path for Vundle plugin
set rtp+=~/.vim/bundle/Vundle.vim
" ******Using the default path to install plugins
" call vundle#begin()                        
" ******Or, pass a path where Vundle should install plugins
" --> path for installing plugin
call vundle#begin('~/.vim/bundle/')

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
Plugin 'scrooloose/syntastic'
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
Plugin 'JamshedVesuna/vim-markdown-preview'

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
"*****Vundle Settings End***********************"



"*****Additional Settings***********************"


"set guifont=Consolas:h16:cANSI
if has('gui_running')
	autocmd GUIEnter * set vb t_vb=
	autocmd GUIEnter * simalt ~x
endif

set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set guifont=Monospace\ 13
set shiftwidth=4
set tabstop=4	
set colorcolumn=120
set autoindent
set smartindent
set number
syntax enable
set background=dark
colorscheme solarized
" --> startup directory
exec 'cd ' . fnameescape('~/PycharmProjects')

" for Syntastic Plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
" E128(indent)
let g:syntastic_python_flake8_args='--ignore=E501,E225,E128'
let g:syntastic_javascript_checkers = ['jshint']

" For vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
" For tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_autoclose = 0
" For vim-markdown
let vim_markdown_preview_hotkey='<C-m>'
" For jedi-vim
" not show the docstring window
autocmd FileType python setlocal completeopt-=preview


" Key Mapping
" let mapleader = ','


:imap jj <ESC>

:nmap j <up>
:nmap k <down>
:nmap <F9> :w<Esc>:!python3 %<CR>
:nmap <F7> :w<Esc>:!gcc % && a<CR>

:vmap i k
:vmap <F9> !python<CR>



"****Additional Settings End********************"
