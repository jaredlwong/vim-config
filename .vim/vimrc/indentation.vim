" set filetype

" 14 tabs and indenting
set tabstop=8     " insert 8 spaces for every tab

set shiftwidth=8  " insert 8 spaces if autoindent chooses to indent new line
set softtabstop=0 " insert 0 spaces for every tab
set noexpandtab     " don't convert tabs to spaces

set smarttab      " a <Tab> in an indent inserts shiftwidth spaces

set autoindent  " autoindent the lines according to the previous lines
set smartindent " don't always indent if obvious from syntax

autocmd FileType html       setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType htmldjango setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType ruby       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c          setlocal shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType cpp        setlocal shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType json       setlocal shiftwidth=2 softtabstop=2 expandtab

function TabToggle()
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
