" colors
syntax on

set guifont=Monaco:h14
set background=dark

colorscheme solarized

" style
set number
set autoindent

" whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" ruby
au BufRead,BufNewFile {Gemfile,Rakefile,config.ru} set ft=ruby

" load the plugin and indent settings for the detected filetype
filetype plugin indent on
