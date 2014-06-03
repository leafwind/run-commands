" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Apr 13
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set nu

set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
  set nowritebackup
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
  " For all text files set 'textwidth' to 78 characters.
  au FileType text setlocal tw=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  " if it doesn't work, TRY 'sudo chown user:group ~/.viminfo'

endif " has("autocmd")

" My own settings

set cindent
set paste
set fileencodings=utf-8,big5,taiwan
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set hls                
set nocompatible
set sw=2
set tabstop=4 " the # of space equals to tab
set softtabstop=4
set expandtab " replace tab with space
set ic " search ignore case
set ru " # of line & # of char
set cursorline " display line of current cursor

set laststatus=2 " expand status line to height of 2
set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%]


syntax on
highlight Comment ctermfg=darkcyan
highlight Search term=reverse ctermbg=4 ctermfg=7
set background=dark
autocmd FileType c call EditC()
autocmd FileType cpp call EditC()
autocmd FileType cxx call EditC()
autocmd FileType h call EditC()
autocmd FileType java call EditC()

if has("iconv")
   autocmd FileType php call EditUTF8()
   autocmd FileType htm call EditUTF8()
   autocmd FileType html call EditUTF8()
   autocmd FileType js call EditUTF8()
   autocmd FileType css call EditUTF8()
endif

function EditUTF8()
  set encoding=utf-8
  set termencoding=big5
  set fileencoding=utf-8
  set fileencodings=ucs-bom,big5,utf-8,latin1
endfunction

function EditC()
  set number
endfunction
