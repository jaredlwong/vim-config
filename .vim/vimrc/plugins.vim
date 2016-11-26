set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Run `vim +PluginInstall +qall` to install
" bootstrap vundle
Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'          " file browser
Plugin 'bling/vim-airline'            " status line
Plugin 'ctrlpvim/ctrlp.vim'           " file search
Plugin 'tpope/vim-fugitive'           " git
Plugin 'Valloric/YouCompleteMe'       " code completion
Plugin 'MattesGroeger/vim-bookmarks'  " bookmarks

" language specific stuff
Plugin 'jnwhiteh/vim-golang'
Plugin 'fatih/vim-go'
Plugin 'guersam/vim-j'
Plugin 'derekwyatt/vim-scala'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()

filetype plugin indent on

