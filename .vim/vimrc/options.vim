scriptencoding utf-8
set encoding=utf-8

" look at :options for reference

" 1 important
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" 2 moving around, searching and patterns
set noautochdir   " change working directory to whichever file is currently being edited
set wrapscan    " search commands wrap around the end of the buffer
set incsearch   " incremental search
set ignorecase  " ignore case for most searches
set smartcase   " ignore ignorecase option if search includes upper case characters

" 3 tags
" nothing

" 4 displaying text
set wrap         " wrap long lines
set showbreak=>\   " if a line is wrapped preface it with a '> '
set display=uhex " view unprintable characters by their hex value <xx>
set lazyredraw   " don't redraw while executing macros
set list         " show trailing whitespace and tabs
" tab for tabs; trail for trailing whitespace; extends/precedes for text off screen
" nbsp for non-breakable white-space
set listchars=tab:\|\ ,trail:•,extends:>,precedes:<,nbsp:+
set number       " show line numbers

" 5 syntax, highlighting and spelling
syntax on       " by default don't highlight syntax
set nohlsearch  " by default don't highlight search results
set nospell     " could be useful for text files; let default be off

" 6 multiple windows
set hidden      " don't unload buffers no longer shown in windows
set splitbelow  " new window put below current window
set splitright  " new window put right of the current window

" 7 multiple tab pages
" nothing

" 8 terminal
" nothing

" 9 mouse
set mouse=a

" 10 printing
" nothing

" 11 messages and info
set showcmd     " show current vim command in bottom right
set showmode    " show current mode at the bottom (default off in vi, on in vim)
set ruler       " show cursor position in bottom right
set confirm     " bring up confirm dialog if you try to :q or :e w/o saving vag

" 12 selecting text
" nothing

" 13 selecting text
set undolevels=1000 " allow up to 1000 undos; just for portability
set backspace=indent,eol,start " just for portability

" 14 tabs and indenting
" see <indentation.vim>

" 15 folding
" nothing

" 16 diff mode
" nothing

" 17 mapping
" nothing

" 18 reading and writing files
set fileformat=mac " sets <EOL> for buffers other common choice is unix
set nowritebackup " would temporarily write backup before saving and delete if successful
set nobackup      " would write persistent backup
set noautoread  " autoread doesn't actually work unless you run external command

" 19 the swap file
set noswapfile    " move all buffers to memory

" 20 command line editing
set history=1000

" 21 executing external commands
" nothing

" 22 running make and jumping to errors
" nothing

" 23 language specific
" nothing

" 24 multi-byte characters
set encoding=utf-8 " set default encoding for buffers, etc.

" 25 various
set gdefault       " automatically add g to end of :s command; change all occurances in lines

set wildignore=bin
