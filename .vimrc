" break with the busted old vi junk
" must be first
set nocompatible
filetype off


" Use Bash shell, Avoid zsh/fish shell issues
set shell=/bin/bash

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" vundle repo
Bundle 'gmarik/Vundle.vim'

" productivity
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-pathogen'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'benjaminwhite/Benokai'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'nginx.vim'

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'

" Surround Brackets
Plugin 'tpope/vim-surround'

" JS Frameworks (Highlight)
Plugin 'gregsexton/matchtag'
Plugin 'httplog'

" Languages
Plugin 'ap/vim-css-color'

" Syntax Languages
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'hdima/python-syntax'
Plugin 'othree/html5.vim'
Plugin 'stephpy/vim-yaml'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'moll/vim-node'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'StanAngeloff/php.vim'
Plugin 'isruslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'

" Autocomplete
Plugin 'valloric/youcompleteme' " Requires compilation
let g:ycm_python_binary_path = '/usr/bin/python3'
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev python3-dev
" cd ~/.vim/bundle/YouCompleteMe && ./install.py

" Docker
Plugin 'ekalinin/dockerfile.vim'
Plugin 'docker/docker'

" misc
Bundle "editorconfig/editorconfig-vim"
Bundle "vim-scripts/gitignore"
Plugin 'nathanaelkane/vim-indent-guides'


" error handling
Bundle "nvie/vim-flake8"
Bundle "scrooloose/syntastic"

" For vim-airline
let g:airline#extensions#tabline#enabled = 1

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=237

let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
" let g:indentLine_char = 'c'

" For vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" custom file ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }


""""""""""""""""""""""""""""""""""""""""
" General VIM
""""""""""""""""""""""""""""""""""""""""


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show line numbers
set number

" show lines in lower right
set ruler

" don't wrap lines ever
set nowrap

" Set to auto read when a file is changed from the outside
set autoread

" global text columns
" set textwidth=80

" don't automatically break long lines unless they are new
"set formatoptions+=l

" detect file type, turn on that type's plugins and indent preferences
" Turned off -- This was annoying when copy/pasting causes indent problems
" filetype plugin on
" filetype plugin indent on

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" allow background buffers
set hidden

" global tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" ignore these nonsense files
set wildignore=*.swp,*.bak,*.pyc,*.class

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" no backups, please!
set nobackup
set noswapfile

" keep a longer history
set history=1000

" enable folding
"set foldmethod=indent
"set foldlevel=99

" make file/command tab completion useful
set wildmode=list:longest

" clipboard fusion!
set clipboard^=unnamed clipboard^=unnamedplus

" Source the vimrc file after saving it.
" This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

""""""""""""""""""""""""""""""""""""""""
" Hotkeys
""""""""""""""""""""""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""

" show search matches as you type
set incsearch

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" highlight search results
set hlsearch

""""""""""""""""""""""""""""""""""""""""
" Aestehtics
""""""""""""""""""""""""""""""""""""""""

" keep cursor somewhat centered
set scrolloff=3

" highlight current line
set cursorline

" invert and bold status line
set highlight=sbr

" enable syntax highlighting
syntax on

"tell the term has 256 colors
set t_Co=256

colorscheme Benokai
set guifont=Inconsolata\ Medium\ 10

" highlight col 80
"set colorcolumn=80
"highlight ColorColumn guibg=#333

" extra whitespace sucks, make it RED
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
