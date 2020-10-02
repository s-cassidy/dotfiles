
" Disable compatibility mode. Needed for most plugins to work.
set nocp
" For dictionaries
set spelllang=en_uk

" Allow unsaved buffers to be open in the background
set hidden

" Show where I am in the file!
set ruler
set number

" Have special settings for each filetype.
filetype plugin on

"When splitting windows, prefer to open new splits below/to the right of current
"split.
set splitbelow
set splitright

"Set the file name as the window title; useful for switching windows
let &titlestring = "" . expand("%:t") . ""
set title

"SEARCHING PREFERENCES
" I prefer searching without highlighting the results
set nohlsearch
" smartcase -- searching is only case sensitive if the search term includes
" uppercase letters
set smartcase
" real-time preview of search and replace :: neovim feature
set inccommand=nosplit  


"Mouse support on
set mouse=a


"loading plugins etc
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
let g:pathogen_disabled = ['YouCompleteMe', 'taskwiki', 'supertab', 'vim-taskwarrior',  'vim-sneak', 'vim-markology', 'ale' ]
call pathogen#infect()

"Thesaurus
let g:tq_enabled_backends=["openoffice_en"]
let g:tq_openoffice_en_file="~/.vim/thesaurus/th_en_US_new"

let g:ale_set_highlights = 0


" COLOURS STUFF

let g:terminal_color_0  = '#282828'
let g:terminal_color_1  = '#98971a'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#d79921'
let g:terminal_color_4  = '#458588'
let g:terminal_color_5  = '#b16286'
let g:terminal_color_6  = '#689d6a'
let g:terminal_color_7  = '#a89984'
let g:terminal_color_8  = '#928374'
let g:terminal_color_9  = '#fb4934'
let g:terminal_color_10 = '#b8bb26'
let g:terminal_color_11 = '#fabd2f'
let g:terminal_color_12 = '#83a598'
let g:terminal_color_13 = '#d3869b'
let g:terminal_color_14 = '#8ec07c'
let g:terminal_color_15 = '#ebdbb2'
set termguicolors
set background=dark
syntax enable
set conceallevel=2
let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italic = 1
colorscheme gruvbox


"Some colorschemes comes with nice light and dark themes. This toggles between
"the two.
call togglebg#map("<F2>")
hi Conceal ctermfg=7 guifg=#B48EAD guibg=none


" easymotion settings
" Set easymotion to the spacebar in both normal and visual mode.
nmap <Space> <Plug>(easymotion-prefix)
vmap <Space> <Plug>(easymotion-prefix)


" Configure easymotion to behave more like vim-sneak
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" other preferences
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'


" Set this to start scrolling when the cursor is 3 lines from the edge of the
" page.
set scrolloff=3

" word wrap
set wrap
set lbr

" CtrlP settings
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_max_depth = 40
let g:ctrlp_working_path_mode = 'ra'
"Setting <CR> to CtrlP means <CR><CR> toggles the most recently used buffer.
nmap <CR> :CtrlPBuffer<CR>
"CtrlP session switcher
" <Leader>ss for "switch session"
nnoremap <Leader>ss :CtrlPObsession<CR>

" Switch between split window frames with ctrl+motion
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>
nnoremap <C-h> <C-W><C-h>

" make moving up and down play nicely with word wrapping, but retain default
" behaviour if there is a count (eg. 10j still goes down 10 actual lines)
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

" sets italic fonts
set t_ZH=^[[3m
set t_ZR=^[[23m


"terminal mode commands
nnoremap <Leader>vt :vsplit<CR>:terminal<CR>A
nnoremap <Leader>ht :split<CR>:terminal<CR>A
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

" can't remember what this does.
if !has('nvim')
        set ttymouse=xterm2
    endif

"Sessions
let g:prosession_on_startup = 1

" understand .sage files are python files
autocmd BufRead,BufNewFile *.sage set filetype=python


" This enables automatic indentation as you type for certain filestypes (e.g.
" python, tex
filetype indent on


"let g:UltiSnipsExpandTrigger="<c-tab>"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
inoremap <c-x><c-k> <c-x><c-k>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"recognize : as a word
set iskeyword+=:

" to use ranger as a file explorer in vim 
nnoremap <silent><Leader>c :vsplit<CR>:RangerOpenCurrentDir<CR>
nnoremap <silent><Leader>f :RangerOpenProjectRootDir<CR>
nnoremap - :vsplit %:p:h<cr>

" Completion stuff
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

function! Auto_complete_string()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
    end
endfunction

function! Auto_complete_opened()
    if pumvisible()
        return "\<Down>"
    end
    return ""
endfunction

inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <s-tab> Auto_complete_string()


" AIRLINE SETTINGS
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#vimtex#enabled = 1
" Show just the filename
"
"
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
