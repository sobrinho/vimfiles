" pathogen
call pathogen#infect()

" colors
syntax on

if has('gui_running')
  set guifont=Monaco:h14
  set background=light
else
  set background=dark
endif

colorscheme solarized

" style
set number
set autoindent
set cursorline

" whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list
set listchars=tab:\ \ ,trail:·

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" This tip is an improved version of the example given for :help last-position-jump.
" It fixes a problem where the cursor position will not be restored if the file only has a single line.
"
" See: http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" RSpec
map , :w\|!rspec --format documentation %<CR>

" load the plugin and indent settings for the detected filetype
filetype plugin indent on
