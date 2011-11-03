:filetype plugin on
set encoding=utf-8
set number
" Los mensajes del editor en ingles (se ve mal en windwows)
set langmenu=en
" Arregla el comportamiento extraño del backspace
set backspace=eol,start,indent
"set guioptions=  "Deja la ventana sin ninguna opcion gui (menu, scroll,...)
set guioptions=r "Pone una barra de scroll a la derecha
syntax on
" Busqueda incremental que ignora Mayus/minusculas
set incsearch
set ignorecase smartcase
" Resalta los resultados de la búsqueda
"set hlsearch
" Ajustes para la identacion
set tabstop=2
set shiftwidth=2
set smarttab autoindent
set expandtab
" Ajuste del ancho de la ventana de texto
set textwidth=0
" Resalta la linea del cursor
"set cursorline
" Coloreado de sintaxis para MXML y ActionScript
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml

" Algunos reajustes para poder moverme en modo insertar sin tener que usar los cursores

inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" Poder pasar al modo normal sin Esc, con un comando más tipo-emacs
inoremap <C-N> <Esc>

" Formato de la barra de estado (desactivado hasta que me lo curre un poco mas)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" este comando muestra la statusbar. Poner a 0 para ocultarla.
set laststatus=2
" una linea de estado sencilla y funcional
:set statusline=%<%F%=%{fugitive#statusline()}\ %{strftime(\"%H:%M:%S\")}\ [%M%R%H%Y]\ (%(%l,%c%))

" Para el curso de C#
com Csc !csc %:p /out:%:p:r.exe
com Launch !%:p:r.exe
map <F9> :Csc<CR>
map <F10> :Launch<CR>

" Opciones para latex suite
set shellslash
set grepprg="grep\ -nH $*"

filetype indent on

let g:tex_flavor='latex'
let g:Tex_Compiler_pdf="pdflatex -synctex=-1 --interaction=nonstopmode $*"

" Configuraciones nuevas para FuzzyFind, NERDTree y TList
"
" Shortcuts
map <F3> :NERDTreeToggle<CR>
map <F4> :Tlist<CR>
map b :FufBuffer<CR>
map  :FufFile<CR>


" TagList a la derecha
let Tlist_Use_Right_Window=1

" Por conveniencia...
" cd ~
" colorscheme xoria256

" para editar PHP
inoremap <?<CR> <?<CR><CR><Tab>?><Up><Tab>

""""""""""""""""""""""""""""""""""""""""""
" 24 de Febrero: Un experimento para relajar
" la muñeca....
imap ¨ {<CR><CR>}<Up><Tab>
" Siempre meto la pata aquí
iab funciton function

""""""""""""""""""""""""""""""""""""""""""
" 25 de Frebrero: Javascript code folding 
" "function! JavaScriptFold() 
"   setl foldmethod=syntax
"   setl foldlevelstart=1
"   syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
" 
"   function! FoldText()
"     return substitute(getline(v:foldstart), '{.*', '{...}', '''}')
"   endfunction
"   setl foldtext=FoldText()
" endfunction
" au FileType javascript call JavaScriptFold()
" au FileType javascript setl fen

""""""""""""""""""""""""""""""""""""""""""
" 27 de Julio 2011: alias for cd to current's file directory
map ,cd :cd %:p:h<CR>:pwd<CR>

""""""""""""""""""""""""""""""""""""""""""
" 5 de Agosto 2011: reload browser tab
map ,r :!ps -xc <bar> grep -sq Chrome && osascript -e 'tell app "Google Chrome"' -e 'activate' -e 'tell app "System Events" to keystroke "r" using {command down}' -e 'tell app "iTerm" to activate' -e 'end tell'<CR><CR>

""""""""""""""""""""""""""""""""""""""""""
" 9 de Septiembre 2011: default mouse support
set mouse=a

""""""""""""""""""""""""""""""""""""""""""
" 19 de Septiembre 2011: CoffeeScript shortcut
nmap ,cc :CoffeeCompile<CR>

""""""""""""""""""""""""""""""""""""""""""
" 26 de Septiembre 2011: Less dumb font selector
if has("gui_gtk2")
  set guifont=Inconsolata\ 10
elseif has("gui_macvim")
  set guifont=Monaco:h13
elseif has("gui_win32")
  set guifont=Consolas:h11
end

""""""""""""""""""""""""""""""""""""""""""
" 27 de Septiembre 2011: Tab shortcuts for macbook
if has('macunix') || has('unix')
  map <F11> gT
  map <F12> gt
end

""""""""""""""""""""""""""""""""""""""""""
" 13 de Octubre 2011: CoffeeScript correctness check
function! CheckCoffeeSyntax (file)
  let l:js = system('coffee -cp ' . a:file)
  let l:error = matchstr(l:js, '^Error: .* line \d*')
  if empty(l:error)
    return
  else
    :echohl ErrorMsg | echo l:error | echohl None
  endif
endfunction

autocmd! BufWritePost *.coffee :call CheckCoffeeSyntax(expand("%:p"))


""""""""""""""""""""""""""""""""""""""""""
" 14 de Octubre 2011: Don't really know why, buts vim keeps
" inserting tabs in my coffeescripts!
autocmd BufRead *.coffee set expandtab

""""""""""""""""""""""""""""""""""""""""""
" Thu Nov 3: Common misspell 
iab tempalte template
