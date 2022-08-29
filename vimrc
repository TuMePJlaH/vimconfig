"------------------------------------------------------------------
filetype plugin indent on
set tabstop=4 " show existing tab with 4 spaces widdth
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " on pressing tab, insert 4 spaces
set smarttab
set smartindent
set number
set noswapfile
set nowritebackup
set nobackup
set colorcolumn=120
set pastetoggle=<F3>
highlight ColorColumn ctermbg=8
highlight ColorColumn guibg=Gray
syntax on
colorscheme onedark
set wildmenu
if has("gui_running")
  set cursorline
  "autocmd BufEnter *.py colorscheme molokai
  set guifont=Courier_New:h11:cDEFAULT
endif

" for correct collor in tmux
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"------------------------------------------------------------------
" clang-format
map <C-K> :py3f ~/.vim/scripts/clang-format.py<cr>
imap <C-K> <c-o>:py3f ~/.vim/scripts/clang-format.py<cr>

"------------------------------------------------------------------
"vmap cc :norm i#<CR>
"vmap uc :norm ^x<CR>
vmap cc :call Comment()<CR>
vmap uc :call UnComment()<CR>
"------------------------------------------------------------------
"if expand('%:e') == "py"
  "map <F5> :w<CR> :!python "%:p"<CR>
"endif
"if expand('%:e') == "cpp" || expand('%:e') == "c" || expand('%:e') == "h" || expand('%:e') == "hpp" || expand('%:e') == "cu"
"  vmap cc :norm i//<CR>
"  vmap uc :norm ^xx<CR>
"endif
"------------------------------------------------------------------
" NERDTree config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"nnoremap <leader>n :NERDTreeFocus<CR>
execute "set <M-n>=\en"
nnoremap <M-n> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-w>n :NERDTreeRefreshRoot<CR>
"nnoremap <C-t> :NERDTree<CR>
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
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'

Plugin 'ludovicchabant/vim-gutentags'

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
"map <C-]> :rightbelow vsplit \| YcmCompleter GoTo<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:ycm_show_diagnostics_ui = 0

:function Comment()
:  let c_type = ['cpp', 'c', 'h', 'hpp', 'cu', 'cc']
:  let type = expand('%:e')
:  let idx = index(c_type, type)
:  if idx != -1
:    :norm i//
:  endif
:  let py_type = ['py']
:  let idx = index(py_type, type)
:  if idx != -1
:    :norm i#
:  endif
:endfunction

:function UnComment()
:  let c_type = ['cpp', 'c', 'h', 'hpp', 'cu', 'cc']
:  let type = expand('%:e')
:  let idx = index(c_type, type)
:  if idx != -1
:    :norm ^xx
:  endif
:  let py_type = ['py']
:  let idx = index(py_type, type)
:  if idx != -1
:    :norm ^x
:  endif
:endfunction

":function! ToTag()
":  if filereadable("tags")
"":    :rightbelow vsplit 
":    :rightbelow vert winc ] 
"":    :exec("tag ".expand("<cword>"))
":  endif
":endfunction

"map <C-]> :rightbelow vsplit <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <C-w><C-]> <C-]><CR>
"nnoremap <C-]> :call ToTag()<CR>
nnoremap <C-]> :rightbelow vert winc ]<CR>
"vs <C-R><C-W><CR> - inser work under cursor in command line
"let g:gutentags_project_root = ['tags']
let g:gutentags_cache_dir = "~/.cache/tags/"
