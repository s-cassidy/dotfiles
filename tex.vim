setlocal sw=2
setlocal ts=2
nnoremap k gk
nnoremap j gj
vnoremap j gj
vnoremap k gk

call IMAP('EA*', "\\begin{IEEEeqnarray*}{<++>} \<CR><++>\<CR>\\end{IEEEeqnarray*}<++>", 'tex')

call IMAP('EAR', "\\begin{IEEEeqnarray}{<++>} \<CR>\label{<++>}\<CR><++>\<CR>\\end{IEEEeqnarray}<++>", 'tex')
inoremap `= &{}={}&
inoremap `. \cdot

" This redefines a new forward search command, <leader>f, which actually works
function! SyncTexForward()
        "     let execstr = "silent !okular --unique %:p:r.dvi\\#src:".line(".")."%:p &"
        let execstr = "silent !okular --unique %:p:r.pdf\\#src:".line(".")."%:p &"
        exec execstr
        exec "redraw!"
endfunction
nmap <Leader>f :call SyncTexForward()<CR>
let g:Tex_ViewRule_pdf = 'zathura'
" Don't insert double quotes when hitting " (useful for tikzcd)
let g:Tex_SmartKeyQuote=0
