set shell=/usr/local/bin/zsh
set nocompatible
set modeline

let g:is_bash = 1
let g:clojure_align_multiline_strings = 1

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden        " hides buffers instead of closing them
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set softtabstop=2 " a tab is two spaces
set expandtab     " always use spaces instead of tabs
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set ruler         " always show line position
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set tabpagemax=100 " 100 tabs
set nofoldenable

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
"set visualbell           " don't beep
"set noerrorbells         " don't beep

" set guifont=Consolas:h10
" set guifontwide=MingLiU:h10 "For windows to display mixed character sets
" set encoding=utf-8

filetype plugin on
filetype plugin indent on
autocmd filetype python set expandtab

au BufRead,BufNewFile *.jimple set filetype=java
au BufRead,BufNewFile *.grimple set filetype=java

if !has("gui_running")
  set term=screen-256color
endif


if &t_Co >= 256 || has("gui_running")
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  set background=dark
  colorscheme solarized
endif

if &t_Co > 2 || has("gui_running")
  " switch syntax highlighting on, when the terminal has colors
  syntax on
endif

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

set pastetoggle=<F2>

nmap <f2> :set number! number?<cr>

nnoremap j gj
nnoremap k gk

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

" Remaps K to split line at cursor
nnoremap K i<CR><Esc>

set nobackup
set nowritebackup
set noswapfile

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
  au BufNewFile,BufRead *.piglet set filetype=pig syntax=pig
augroup END

" LaTeX stuff
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf = '/usr/bin/chromium'
let g:Tex_DefaultTargetFormat = 'pdf'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']

let g:airline#extensions#tabline#enabled = 1
set laststatus=2

