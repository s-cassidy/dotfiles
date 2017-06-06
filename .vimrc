"
set nocp
set ruler
set relativenumber
set number
set nohlsearch
set smartcase
set mouse=a
set spelllang=en_uk
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
call pathogen#infect()

" colours stuff
"let g:solarized_termtrans=1
set t_Co=16
let g:solarized_termcolors=16
syntax enable
set background=dark
call togglebg#map("<F2>")
"colorscheme ChocolateLiquor
"colorscheme jellybeans
"colorscheme solarized
colorscheme gruvbox

set scrolloff=3

" word wrap
set lbr

" remove highlighting
"nnoremap <silent><leader>c :nohls<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"terminal mode commands
"tnoremap <Esc> <C-\><C-n>
"tnoremap <C-h> <C-\><C-n><C-w>h
"tnoremap <C-j> <C-\><C-n><C-w>j
"tnoremap <C-k> <C-\><C-n><C-w>k
"tnoremap <C-l> <C-\><C-n><C-w>l

if !has('nvim')
        set ttymouse=xterm2
    endif

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set iskeyword+=:
