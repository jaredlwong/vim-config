set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" bootstrap vundle
Plugin 'gmarik/vundle'

" install everything else
Plugin 'jnwhiteh/vim-golang'
Plugin 'guersam/vim-j'
Plugin 'derekwyatt/vim-scala'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'octol/vim-cpp-enhanced-highlight'

filetype plugin indent on
