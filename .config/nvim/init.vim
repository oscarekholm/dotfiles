" Check if plug is installed, if not, install and install plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.config/nvim/plugins

colorscheme gruvbox
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set number
set ruler
syntax enable
set encoding=utf-8

set nowrap
set list
set backspace=indent,eol,start

set expandtab
set tabstop=4
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set smartindent

" Other stuff
set guioptions-=T
set guioptions-=r
set guioptions-=L
set noeb vb t_vb=

set splitbelow
set splitright

set clipboard=unnamed

""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set autoread

set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/node_modules/*,*/dist/*
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*

set backupdir^=~/.config/nvim/.backup//    " where to put backup files.
set directory^=~/.config/nvim/.temp//      " where to put swap files.

if has("statusline") && !&cpo
    set laststatus=2  " always show the status bar

    " Start the status line
    set statusline=%f\ %m\ %r
    set statusline+=Line:%l/%L[%p%%]
    set statusline+=Col:%v
    set statusline+=Buf:#%n
    set statusline+=[%b][0x%B]
endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader>n :NERDTreeToggle<CR>

nmap <C-E>, :read !uuidgen <bar> awk '{print(tolower($0))}'<CR>

map <C-p> :GFiles<CR>

let NERDTreeShowLineNumbers=1

" ---------- Custom key mappings ----------
if has('mouse_sgr')
    set ttymouse=sgr
endif

set mouse=a

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" ALE Settings
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'reason': ['refmt'],
\}
let g:ale_fix_on_save = 1

" Make sure all markdown files have the correct filetype set and setup wrapping
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
if !exists("g:disable_markdown_autostyle")
    au FileType markdown setlocal wrap linebreak textwidth=72 nolist tabstop=2 shiftwidth=2
endif

" make Python follow PEP8 for whitespace (http://www.python.org/dev/peps/pep-0008/)
au FileType python setlocal tabstop=4 shiftwidth=4

au FileType css setlocal tabstop=2 shiftwidth=2

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

" Automatically resize splits when resizing MacVim window
autocmd VimResized * wincmd =

" Show double quotes in JSON from elzr/vim-json package
let g:vim_json_syntax_conceal = 0


" let g:syntastic_javascript_checkers = ['jsxhint']
" let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" hi StatusLineNC ctermfg=60 ctermbg=8 cterm=NONE
" hi StatusLine ctermfg=45 ctermbg=8 cterm=NONE
" hi VertSplit ctermbg=8 ctermfg=8 cterm=NONE
set fillchars+=vert:\ 

let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

" Gruvbox?
hi vertsplit ctermfg=238 ctermbg=235
" hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi EndOfBuffer ctermfg=235 ctermbg=235

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode

" Fancy, visible console.log macro
let @l="oconsole.lopg(€kb€kb€kbg('______________________ DEBUG:')console.log(JSON.stringify(, null, 2))bbbbba"
