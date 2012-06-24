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

" Display incomplete commands
set showcmd

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

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

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Ruby
imap <c-l> <space>=><space>

" RSpec
map <Leader>r :call RunTest()<CR>
map <Leader>R :call RunNearestTest()<CR>

function! RunTest()
  call RunTestFile(FindTestFile())
endfunction

function! RunNearestTest()
  call RunTestFile(FindTestFile() . ':' . line('.'))
endfunction

function! FindTestFile()
  let current_file = expand("%")
  let spec_file = current_file

  if match(current_file, '_spec.rb$') == -1
    let spec_file = substitute(spec_file, '^app/', '', '')
    let spec_file = substitute(spec_file, '.rb$', '_spec.rb', '')

    let spec_file = 'spec/' . spec_file
  endif

  return spec_file
endfunction

function! RunTestFile(filename)
  write

  if filereadable('bin/rspec')
    exec ":!bin/rspec --format documentation " . a:filename
  else
    exec ":!bundle exec rspec --format documentation " . a:filename
  endif
endfunction

" Clear the search buffer when hitting return
nnoremap <cr> :nohlsearch<cr>

" load the plugin and indent settings for the detected filetype
filetype plugin indent on
