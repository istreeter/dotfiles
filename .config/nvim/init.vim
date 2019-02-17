autocmd!

set shiftwidth=2 expandtab
set bg=light
set nowrap
set number
" colorscheme ron
syntax on


" Pathogen
" execute pathogen#infect()
" call pathogen#helptags() " generate helptags for everything in 'runtimepath'

filetype plugin indent on

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Start netrw on startup
" autocmd VimEnter * :Vexplore
"
" Change directory to the current buffer when opening files.
" set autochdir
"
" Show file options above the command line
set wildmenu

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'Yggdroot/indentLine'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ElmCast/elm-vim'
" Plug 'fsharp/vim-fsharp'
Plug 'kongo2002/fsharp-vim'
call plug#end()

" plugin indentLine settings
let g:indentLine_char = '|'

" plugin supertab settings
let g:SuperTabDefaultCompletionType = 'context'

" plugin neomake settings
" open the error window automatically
let g:neomake_open_list = 2
autocmd FileType scala,java,perl,python autocmd! BufWritePost * Neomake
"let g:neomake_scala_enabled_makers = ['scalac', 'gradle']
"let g:neomake_scala_enabled_makers = ['scalac', 'scalastyle']
let g:neomake_scala_enabled_makers = ['scalac']
" do ':help quickfix' to undersrtand the scanf format
let g:neomake_gradle_maker = {
      \ 'exe': 'gradle',
      \ 'args': ['assemble'],
      \ 'append_file': 0,
      \ 'errorformat': '%E%\m:%\%%(compileJava%\|compileTarget%\|compileScala%\)%f:%l: %m,' .
        \ '%E%f:%l: %m,' .
        \ '%Z%p^,'.
        \ '%-G\ \ %.%#,'.
        \ '%C%m,'.
        \ '%-G%.%#'
     \ }

" omni completion for java. I could do this for other filetypes/languages too.
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
