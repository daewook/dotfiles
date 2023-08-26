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

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    map <C-p> :FZF<CR>
call plug#end()
