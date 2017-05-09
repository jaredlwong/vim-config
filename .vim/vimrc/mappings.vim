let mapleader = '\<Space>'

" navigate buffers with arrow keys
nnoremap <left> :bprevious<CR>
nnoremap <right> :bnext<CR>

set pastetoggle=<C-k>

" close buffer
nnoremap <leader>q :bd<CR>

" save + close buffer
nnoremap <leader>x :w\|bd<CR>


""""""""""""""""""""""""""""""""""""""""
" go-vim
let g:go_def_mode = "godef"


""""""""""""""""""""""""""""""""""""""""
" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" set cwd as the working path to search
let g:ctrlp_working_path_mode = ''
" search files/buffers/mru
let g:ctrlp_cmd = 'CtrlPMixed'


""""""""""""""""""""""""""""""""""""""""
" NERDTree
nnoremap <leader>. :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

""""""""""""""""""""""""""""""""""""""""
" vim airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
