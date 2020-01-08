autocmd!

set shiftwidth=2 expandtab
set bg=light
set nowrap
set number
" colorscheme ron
syntax on
set ttimeoutlen=10


" Pathogen
" execute pathogen#infect()
" call pathogen#helptags() " generate helptags for everything in 'runtimepath'

filetype plugin indent on

let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_preview = 1

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
"Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'Yggdroot/indentLine'
Plug 'jeetsukumaran/vim-buffergator'
" Plug 'ElmCast/elm-vim'
" Plug 'fsharp/vim-fsharp'
" Plug 'kongo2002/fsharp-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ionide/Ionide-vim', {
      \ 'do':  'make fsautocomplete',
      \}
Plug 'jamessan/vim-gnupg'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" plugin indentLine settings
let g:indentLine_char = '|'

" plugin supertab settings
let g:SuperTabDefaultCompletionType = 'context'

" plugin neomake settings
" open the error window automatically
"let g:neomake_open_list = 2
"autocmd FileType scala,java,perl,python autocmd! BufWritePost * Neomake
"let g:neomake_scala_enabled_makers = ['scalac', 'gradle']
"let g:neomake_scala_enabled_makers = ['scalac', 'scalastyle']
"let g:neomake_scala_enabled_makers = ['scalac']
" do ':help quickfix' to undersrtand the scanf format
"let g:neomake_gradle_maker = {
"      \ 'exe': 'gradle',
"      \ 'args': ['assemble'],
"      \ 'append_file': 0,
"      \ 'errorformat': '%E%\m:%\%%(compileJava%\|compileTarget%\|compileScala%\)%f:%l: %m,' .
"        \ '%E%f:%l: %m,' .
"        \ '%Z%p^,'.
"        \ '%-G\ \ %.%#,'.
"        \ '%C%m,'.
"        \ '%-G%.%#'
"     \ }

" omni completion for java. I could do this for other filetypes/languages too.
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='night_owl'


let g:LanguageClient_serverCommands = {
  \ 'fsharp': g:fsharp#languageserver_command,
  \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
  \ 'scala': ['metals-vim'],
  \ 'python': ['pyls']
  \ }
" disable by default
let g:LanguageClient_autoStart = 0
" throttle, to save plugin from working so hard
let g:LanguageClient_changeThrottle = 2
"let g:LanguageClient_windowLogMessageLevel = "Info"
autocmd FileType fsharp setlocal omnifunc=LanguageClient#complete
autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
cabbrev lc LanguageClientStart
cabbrev lcstop LanguageClientStop
cabbrev lcd call LanguageClient_textDocument_definition()
cabbrev lch call LanguageClient_textDocument_hover()
cabbrev lcr call LanguageClient_textDocument_rename()

"let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile = expand('~/.nvim/LanguageClient.log')
