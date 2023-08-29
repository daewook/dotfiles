set nocompatible
syntax on
set expandtab
set shiftwidth=2
set softtabstop=2
set showmatch
set incsearch
set ignorecase
set smartcase
set hlsearch
set autoindent
set cindent
set nu
set pastetoggle=<F3>
set synmaxcol=6000 "for syntax highlighting on long lines

"remove trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s/+$//e<Bar>:let @/=_s<Bar><CR>

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    map <C-p> :FZF<CR>
  Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline#extensions#tabline#mixed_indent_algo = 1
  Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='murmur'
call plug#end()
