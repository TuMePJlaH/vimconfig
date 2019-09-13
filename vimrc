"------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set number
set noswapfile
set nowritebackup
set nobackup
set colorcolumn=110
highlight ColorColumn ctermbg=8
highlight ColorColumn guibg=Gray
syntax on
colorscheme molokai
set wildmenu
if has("gui_running")
  set cursorline
  "autocmd BufEnter *.py colorscheme molokai
  set guifont=Courier_New:h11:cDEFAULT
endif

vmap cc :norm i#<CR>
vmap uc :norm ^x<CR>
"------------------------------------------------------------------
"if expand('%:e') == "py"
  "map <F5> :w<CR> :!python "%:p"<CR>
"endif
"------------------------------------------------------------------
" NERDTree config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"nmap <C-n> :NERDTreeToggle<CR>
"------------------------------------------------------------------
" for YouCompleteMe
" set encoding=utf-8
"------------------------------------------------------------------
"for Vundle
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'itchyny/lightline.vim'

" Plugin 'klen/python-mode'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" Plugin 'scrooloose/nerdtree'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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
"------------------------------------------------------------------
" For UltiSnips
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" display lightline
set laststatus=2
set noshowmode

let g:ycm_confirm_extra_conf=0

"map <C-]> :YcmCompleter GoToDeclaration<CR>
map <C-]> :rightbelow vsplit \| YcmCompleter GoTo<CR>
