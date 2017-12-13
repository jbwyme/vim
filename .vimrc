if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ruanyl/vim-fixmyjs'

call plug#end()

execute pathogen#infect()
syntax on
colorscheme spacegray
filetype plugin indent on
" Default to soft tabs, 2 spaces
set expandtab
set sw=4
set sts=4
" Except for Makefiles: Hard tabs of width 2
autocmd FileType make set ts=2

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.cql set filetype=cql
au BufRead,BufNewFile *.html set filetype=html
au BufRead,BufNewFile *.sass set filetype=sass

" Show line numbers
set number

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_rc_path = '.eslintrc.js'
let g:fixmyjs_rc_local = 1
let g:fixmyjs_use_local = 1

autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.js :Fixmyjs
autocmd BufWritePre *.json :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.sass :%s/\s\+$//e
autocmd BufWritePre *.css :%s/\s\+$//e

set viminfo='100,<1000,s100,h

let mapleader=" "
noremap <leader>g :Ag! <cword><cr>
noremap <leader>f :Ag<cr>
noremap <leader>l :GFiles?<cr>
noremap <leader><leader>f :Fixmyjs<cr>
set mouse=a

highlight OverLength ctermbg=blue ctermfg=white guibg=#592929 
match OverLength /\%101v.*/

set statusline+=%F
