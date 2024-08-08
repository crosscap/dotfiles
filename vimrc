" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Turn on syntax highlighting.
syntax on

" Detect file types based on file names to enable intelligent automatic
" indentation and other operations
filetype indent plugin on

" Better command line completion
set wildmenu
" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, 
" even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Set some behaviour of auto complete
set infercase

" Enable spell check
set spell

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>

" use different nums in different mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" set an 80-character boundary
set ruler
set colorcolumn=81

" chenge tab's default length
set tabstop=8

" enable smart tab and space trance
set smarttab

" set audoindent
set autoindent

" always show what mode the vim in
set showmode

" show current directory in new tab
map <F3> :tabnew .<CR> 

" use bash mode when need tab complete
set wildmode=longest,list

" show tab and tail space
set list
set listchars=tab:>-,trail:-

" some backup settings
" set nobackup       " no backup files
" set noswapfile     " no swap files
" set nowritebackup  " only in case you don't want a backup file while editing
" set noundofile     " no undo files
set backupskip=/home/crosscap/code/mycode/cs61a/*

" make command mode history trace back more easily
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Create a shortcut to turn off the highlighting feature
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" make working dictionary complete more easily
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" Set a variable on the buffer that tells the sh syntax highlighter
" that this is bash:
let g:is_bash = 1

" enable netrw plug
set nocompatible
filetype plugin on

" enable matchit.vim
runtime macros/matchit.vim

" use vim.plug to manage plugs
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'wikitopian/hardmode'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomasiser/vim-code-dark'
call plug#end()

" enable vscode theme
colorscheme codedark
