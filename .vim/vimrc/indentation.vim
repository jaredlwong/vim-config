" set filetype

" 14 tabs and indenting
set tabstop=8     " insert 8 spaces for every tab

set shiftwidth=8  " insert 8 spaces if autoindent chooses to indent new line
set softtabstop=0 " insert 0 spaces for every tab
set noexpandtab     " don't convert tabs to spaces

set smarttab      " a <Tab> in an indent inserts shiftwidth spaces

set autoindent  " autoindent the lines according to the previous lines
set smartindent " don't always indent if obvious from syntax


"autocmd BufRead,BufNewFile *.thrift     setfiletype=thrift
"autocmd BufRead,BufNewFile *.ql         setfiletype=sql
"autocmd BufRead,BufNewFile *.tmpl       setfiletype=tmpl
"autocmd BufRead,BufNewFile *.dash       setfiletype=dash


autocmd FileType html       setlocal shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType htmldjango setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType ruby       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python     setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c          setlocal shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType cpp        setlocal shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType json       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType haskell    setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType thrift     setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType sql        setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType xml        setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType markdown   setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType java       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType tmpl       setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType dash       setlocal shiftwidth=2 softtabstop=0 noexpandtab


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
