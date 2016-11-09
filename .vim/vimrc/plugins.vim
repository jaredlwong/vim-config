set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" bootstrap vundle
Plugin 'gmarik/vundle'

" install everything else
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'

" language specific stuff
Plugin 'jnwhiteh/vim-golang'
Plugin 'fatih/vim-go'
Plugin 'guersam/vim-j'
Plugin 'derekwyatt/vim-scala'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'davidhalter/jedi-vim'

call vundle#end()

filetype plugin indent on

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" vim airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
