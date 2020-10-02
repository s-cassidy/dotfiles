setlocal sw=2
setlocal ts=2
"set dictionary+=~/.vim/ftplugin/latex-suite/dictionaries/dictionary
"set complete+=k
call IMAP('EA*', "\\begin{IEEEeqnarray*}{<++>} \<CR><++>\<CR>\\end{IEEEeqnarray*}<++>", 'tex')

call IMAP('EAR', "\\begin{IEEEeqnarray}{<++>} \<CR>\label{<++>}\<CR><++>\<CR>\\end{IEEEeqnarray}<++>", 'tex')
inoremap `= &{}={}&
inoremap `. \cdot
inoremap :: \colon
" This redefines a new forward search command, <leader>f, which actually works
"function! SyncTexForward()
"        "     let execstr = "silent !okular --unique %:p:r.dvi\\#src:".line(".")."%:p &"
"        let execstr = "silent !okular --unique %:p:r.pdf\\#src:".line(".")."%:p &"
"        exec execstr
"        exec "redraw!"
"endfunction

let g:Tex_ViewRule_pdf = 'zathura'

" Zathura settings
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_progname = 'nvr'

"let b:ale_linters = ['proselint', 'vale', 'write-good']
let g:ale_linters_explicit = 1


" Tweak a few compiler settings
let g:vimtex_compiler_latexmk = {
      \ 'backend' : 'nvim',
      \ 'background' : 1,
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-pdf',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

"function! SyncTexForward()
"" remove 'silent' for debugging
"        execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
"	exec "redraw!"
"endfunction
"
"nmap <Leader>f :call SyncTexForward()<CR>
" Don't insert double quotes when hitting " (useful for tikzcd)
let g:Tex_SmartKeyQuote=0
let g:Tex_DefaultTargetFormat = 'pdf'
"let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -src-specials -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'
let g:Tex_BibtexFlavor = 'bibtex'

" Inserts an array of jump points of size horiz x vert 
"function! InsertArray(vert, horiz)
"  if  a:vert < 1 || a:horiz < 1
"    echoerr "Your matrix won't be big enough!"
"    return
""  endif
"
"  let l:list = []                     " empty array which will hold lines
"
"  let l:counterHoriz = 0              
"  let l:counterVert = 0
"  let l:str = ""                      " empty string for lines
"  let l:strlast = ""                   " last line will be different from the rest
"
"  while l:counterHoriz < a:horiz - 1      " populate l:str with horiz many jumppoints
"    let l:strlast = l:strlast."<++> & "
"    let l:counterHoriz += 1
"  endwhile
"  let l:strlast = l:strlast."<++> "
"
"  let l:str = l:strlast."\\\\"         " add a newline to end of l:str
"  while l:counterVert < a:vert - 1     " add l:str to l:list horiz-1 many times
"    call add(l:list, l:str)
"    let l:counterVert += 1
"  endwhile
"  call add(l:list, l:strlast)          " add l:strlast at the end
"  call append('.', l:list)             " add this to the file
"
"  let l:totlines = a:vert + 1          " indent everything
"  execute "normal =".l:totlines."j"
"endfunction

" Same as above, but surrounded by \begin{tabular}{ccc...} etc.

call textobj#user#plugin('bigdelimiters', {
\   'bigdelimiters': {
\     'pattern': ['\\left[(|\[|\|]', '\\right[)|\]|\|]'],
\     'select-a': 'ad',
\     'select-i': 'id',
\   },
\ })



function! InsertTable(vert, horiz)
  if  a:vert < 1 || a:horiz < 1
    echoerr "Your matrix won't be big enough!"
    return
  endif

  let l:list = []                     
  let l:args = ""                     
  let l:argcounter = 0

  while l:argcounter < a:horiz                      " populate arg list, e.g. cccc
    let l:args = l:args . "c"
    let l:argcounter += 1
  endwhile

  let l:begintb = "\\begin{tabular}"."{".l:args."}" " create first line of tabular
  call add(l:list, l:begintb)                       " add first line to l:list
  let l:counterHoriz = 0
  let l:counterVert = 0
  let l:str = ""
  let l:strlast = ""

  while l:counterHoriz < a:horiz - 1
    let l:strlast = l:strlast."<++> & "
    let l:counterHoriz += 1
  endwhile
  let l:strlast = l:strlast."<++> "

  let l:str = l:strlast."\\\\"
  while l:counterVert < a:vert - 1
    call add(l:list, l:str)
    let l:counterVert += 1
  endwhile
  call add(l:list, l:strlast)

  call add(l:list, "\\end{tabular}")                " add last line of tabular

  call append('.', l:list)

  let l:totlines = a:vert + 2
  execute "normal =".l:totlines."j"
endfunction

