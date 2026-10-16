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
" Copy text to the local clipboard. Uses pbcopy on a local Mac; over SSH (or
" without pbcopy) sends an OSC 52 escape so the terminal sets the clipboard.
function! CopyToClipboard(text)
  if executable('pbcopy') && empty($SSH_TTY)
    call system('pbcopy', a:text)
  else
    let l:b64 = system('base64 | tr -d "\n"', a:text)
    let l:osc = "\e]52;c;" . l:b64 . "\x07"
    call writefile([l:osc], '/dev/tty', 'b')
  endif
endfunction
" \c: copy the visual selection to the clipboard
vnoremap <leader>c y:call CopyToClipboard(@")<CR>
" \c in normal mode: copy the current line
nnoremap <leader>c yy:call CopyToClipboard(@")<CR>


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
