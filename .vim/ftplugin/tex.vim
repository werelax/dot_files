set cursorline!
set linebreak
set hlsearch!

set sw=2
set iskeyword+=:

let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode -synctex=-1 $*'
let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "C:\Utilidades\SumatraPDF-Tex.exe"


