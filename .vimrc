" jaredlwong's vimrc
" created ~2012


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options

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
set listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:+
set number       " show line numbers

" 5 syntax, highlighting and spelling
syntax on       " by default don't highlight syntax
set hlsearch  " by default highlight search results
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
set mouse=""

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
set nofoldenable

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Run `vim +PluginInstall +qall` to install
" bootstrap vundle
Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'            " file browser
Plugin 'bling/vim-airline'              " status line
Plugin 'vim-airline/vim-airline-themes' " status line themes
Plugin 'ctrlpvim/ctrlp.vim'             " file search
Plugin 'tpope/vim-fugitive'             " git
" Plugin 'Valloric/YouCompleteMe'       " code completion
Plugin 'MattesGroeger/vim-bookmarks'    " bookmarks
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-abolish'              " camel/underscore
Plugin 'tpope/vim-commentary'           " comment things with `gc`

" language specific stuff
Plugin 'jnwhiteh/vim-golang'
Plugin 'fatih/vim-go'
Plugin 'guersam/vim-j'
Plugin 'derekwyatt/vim-scala'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'leafgarland/typescript-vim'
Plugin 'elixir-editors/vim-elixir'

" python
Plugin 'fisadev/vim-isort'              " sort python imports
Plugin 'Vimjas/vim-python-pep8-indent'  " indent like pep8 likes

" react
Plugin 'mxw/vim-jsx'

call vundle#end()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings

let mapleader = "\<Space>"

" navigate buffers with arrow keys
nnoremap <left> :bprevious<CR>
nnoremap <right> :bnext<CR>

set pastetoggle=<C-k>

" save and close buffer while maintaining any splits
nnoremap <C-x> <C-w>q<CR>

" go-vim
let g:go_def_mode = "godef"

" ctrlp
let g:ctrlp_map = '<C-p>'
" default to using regexp mode
let g:ctrlp_regexp = 1
" set cwd as the working path to search
let g:ctrlp_working_path_mode = 'rw'
" search files/buffers/mru
let g:ctrlp_cmd = 'CtrlPMixed'
" only search git repos, files must be checkedin (from help docs):
" Single VCS, listing command does not list untracked files:
let g:ctrlp_user_command = {
  \ 'types' : {
    \ 1: ['.git', 'cd %s && git ls-files'],
  \ },
  \ 'fallback': 'find %s -type f',
\ }

" NERDTree
nnoremap <leader>. :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

" vim airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" ycm
" use ycm's goto def, instead of vim's default
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gl :YcmCompleter FixIt<CR>

" grep
noremap - :cprev<CR>
noremap = :cnext<CR>
command -nargs=+ Gr execute 'silent Ggrep!' <q-args> | silent! botright cwindow 15 | cc | redraw! | let @/=<q-args> | set hlsearch
nnoremap gr :Gr <C-R>=expand("<cword>")<CR><CR>
noremap <leader>h :set hlsearch! hlsearch?<CR>
noremap <leader>g :cclose <bar> set hlsearch! hlsearch?<CR>
" search current word
noremap <leader>s viwy/<C-R>0<CR>N


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors

" colorscheme molokai

set t_Co=256

"colorscheme jellybeans
"colorscheme molokai
"colorscheme pyte
"colorscheme smyck
"colorscheme solarized
"colorscheme vividchalk

"syntax enable
"set background=dark
"colorscheme solarized
"
"hi CursorLine ctermbg=234
"hi CursorLine ctermfg=15
"
""colorscheme pyte
"hi Comment        ctermfg=246
"hi pythonFunction ctermfg=4
"
"hi SpecialKey ctermbg=none
"hi SpecialKey ctermfg=246

"colorscheme getafe
"hi Comment    ctermfg=LightBlue

" let &colorcolumn=join(range(97,999),",")
" highlight ColorColumn ctermbg=255

let g:airline_theme='papercolor'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" language settings/extensions

" set filetype

" 14 tabs and indenting
set tabstop=8     " insert 8 spaces for every tab

set shiftwidth=8  " insert 8 spaces if autoindent chooses to indent new line
set softtabstop=0 " insert 0 spaces for every tab
set noexpandtab     " don't convert tabs to spaces

set smarttab      " a <Tab> in an indent inserts shiftwidth spaces

set autoindent  " autoindent the lines according to the previous lines
set smartindent " don't always indent if obvious from syntax


autocmd FileType html       setlocal shiftwidth=2 softtabstop=4 expandtab
autocmd FileType htmldjango setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType ruby       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c          setlocal shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType cpp        setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType json       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType haskell    setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType thrift     setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType sql        setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType xml        setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType markdown   setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType elixir     setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType java       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType tmpl       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType dash       setlocal shiftwidth=2 tabstop=2 softtabstop=0 noexpandtab
autocmd FileType dash       setlocal nowrap
autocmd FileType tmpl       setlocal nowrap
autocmd FileType bzl        setlocal shiftwidth=4 softtabstop=4 expandtab

autocmd FileType python cabbrev fc !yapf --style='{based_on_style: pep8, column_limit: 96}'
autocmd FileType python cabbrev fi !isort
	\    --line-width 120
	\    --builtin collections
	\    --builtin functools
	\    --builtin itertools
	\    --builtin logging
	\    --builtin random
	\    --thirdparty gevent
	\    --thirdparty pinstatsd
	\    --thirdparty mock
	\    --thirdparty flask
	\    --thirdparty thrift
	\    --thirdparty tower
	\    --thirdparty werkzeug
	\    --force-single-line-imports
	\    -

function! TabToggle()
    if &expandtab
        set shiftwidth=8
        set softtabstop=0
        set noexpandtab
    else
        set shiftwidth=4
        set softtabstop=4
        set expandtab
    endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z


" turn width off nowrap
" nnoremap <leader>w :call WidthToggle()<CR>
" let g:width_toggle_on = 1
" function! WidthToggle()
"     if g:width_toggle_on
"         setlocal textwidth=96
"         setlocal wrap
"         let &colorcolumn=join(range(97,999),",")
"         let g:width_toggle_on = 0
"     else
"         setlocal textwidth=1000
"         setlocal nowrap
"         set colorcolumn=
"         let g:width_toggle_on = 1
"     endif
" endfunction
" let &colorcolumn=+0
" let g:width_toggle_on = 0
" let &colorcolumn=join(range(97,999),",")

setlocal wrap
" color everything grey
"highlight ColorColumn ctermbg=235
" default to 96 because it's half the size of my macbook air
" setlocal textwidth=96
autocmd FileType java setlocal textwidth=100
" autocmd FileType * let &colorcolumn=join(range(&textwidth,999),",")
