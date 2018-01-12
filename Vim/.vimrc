"-------------------------------"
" ---- Common vim settings ---- "
" http://amix.dk/vim/vimrc.html "
"-------------------------------"

" Sets how many lines of history VIM has to remember
set history=1000

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable

" Background theme
set background=dark

" Show line numbers
set nu

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Always show the status line
set laststatus=2

" Always show tabs
set showtabline=2

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" highlight the current line 
set cursorline

" Autoupdate buffer
" http://stackoverflow.com/a/7069592/3778796
set autoread

" Treat less files as css
au BufNewFile,BufRead *.less set filetype=css

" Highlight Nginx config files (http://www.vim.org/scripts/script.php?script_id=1886)
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

"-----------------"
" Include plugins "
"-----------------"

source ~/.vimrc.plugins


"-----------------"
" Plugin settings "
"-----------------"

" airline "
"-------------------------------------"
" requires fonts patch: https://github.com/Lokaltog/powerline-fonts
let g:airline_powerline_fonts=1
" enable/disable enhanced tabline
let g:airline#extensions#tabline#enabled=1
" configure filename match rules to exclude from the tabline
let g:airline#extensions#tabline#excludes=[]
" configure how numbers are calculated in tab mode
let g:airline#extensions#tabline#tab_nr_type=1
" enable/disable displaying tab type (far right)
let g:airline#extensions#tabline#show_tab_type=0
" Name of buffer - only filename instead of path"
let g:airline#extensions#tabline#fnamemod=':t'
" configure whether close button should be shown
let g:airline#extensions#tabline#show_close_button=0
" tab number format
let g:airline#extensions#tabline#buffer_nr_show='%s:'
" 
let g:airline#extensions#bufferline#enabled=1

" Sections
function! AirLineInit()
    let spc = g:airline_symbols.space
    let g:airline_section_b = airline#section#create(['tagbar', 'filetype'])
    let g:airline_section_c = airline#section#create([''])
    let g:airline_section_x = airline#section#create(['%<', 'file', spc, 'readonly'])
    let g:airline_section_z = airline#section#create(['%3p%%'.spc, '%4l :', '%3c'])
    let g:airline_section_warning = airline#section#create([''])
endfunction
autocmd Vimenter * call AirLineInit()

" Theme
let g:airline_theme='solarized_custom'
"-------------------------------------"


" solarized colorscheme "
"-------------------------------------"
" (requires Gnome Terminal patch: https://github.com/Anthony25/gnome-terminal-colors-solarized) "
" Set colors palette to 16
set t_Co=16
" apply colorscheme
colorscheme solarized

" override cursorline color settings
" hi CursorLine term=underline cterm=underline ctermbg=NONE ctermfg=NONE

" override NonText characters (like tilde ~ on empty lines) with same colos as bg
hi NonText ctermfg=0

" override some colors for NERDtree
" Directory in tree
hi treeDir ctermfg=4
" Any special symbol (pipe character in tree)
hi Special ctermfg=14
" Any statement (project path)
hi Statement ctermfg=3
" Dir expand/collapse symbol in tree
hi Title ctermfg=14
" File symbol in tree
hi Type ctermfg=14
"-------------------------------------"


" nerdtree "
" remove arrows in dirs
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
" see also customization of solarized colorscheme
"-------------------------------------"

" vim-nerdtree-tabs "
"-------------------------------------"
let g:nerdtree_tabs_open_on_console_startup=1
"-------------------------------------"
