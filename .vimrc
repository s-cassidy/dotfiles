
" Disable compatibility mode.
set nocp

" Show where I am in the file!
set ruler
set relativenumber
set number

"SEARCHING PREFERENCES
" I like to search without highlighting, usually. this one is definitely
" personal preference
set nohlsearch
" smartcase -- searching is only case sensitive if the search term includes
" uppercase letters!
set smartcase

"Mouse support on
set mouse=a

set spelllang=en_uk

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
call pathogen#infect()

" COLOURS STUFF
"Some colorschemes might benefit from these settings
"let g:solarized_termtrans=1
"set t_Co=16
"let g:solarized_termcolors=16


set background=dark
syntax enable

"Some colorschemes comes with nice light and dark themes. This toggles between
"the two.
call togglebg#map("<F2>")

"Color schemes I like. Current favourite is gruvbox
"colorscheme ChocolateLiquor
"colorscheme jellybeans
"colorscheme solarized
colorscheme gruvbox

" Set this to start scrolling when the cursor is 3 lines from the edge of the
" page.
set scrolloff=3

" word wrap
set lbr

" remove highlighting
"nnoremap <silent><leader>c :nohls<CR>

" Switch between buffers with ctrl + motion
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
