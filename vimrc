" pathogen
execute pathogen#infect()

" colors
syntax on

if has('gui_running')
  set background=light
else
  set background=dark
endif

colorscheme solarized

" style
set number
set autoindent
set cursorline
set ruler

set colorcolumn=80

" whitespace
set list
set listchars=tab:\ \ ,trail:·

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Display incomplete commands
set showcmd

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

" netrw
map <Leader>n :Explore<CR>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Move around quickfix list with ]q and [q
map ]q :cnext<CR>
map [q :cprev<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Ruby
imap <c-l> <space>=><space>

" RSpec
let g:rspec_command = "!bin/rspec {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" ag
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" This defines a new command Ag to search for the provided text and open a
" quickfix window
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Clear the search buffer when hitting space
nnoremap <space> :nohlsearch<cr>

" Do not jump on searching with * and #
nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap # :keepjumps normal! mi#`i<CR>

" Keep visual selection while indenting with < and >
vnoremap < <gv
vnoremap > >gv

" Copy and paste from external clipboard with <leader>c and <leader>p
map <Leader>c y:call system("pbcopy", getreg(""))<CR>
map <Leader>p :call setreg("d", system("pbpaste"))<CR>"dp

" Rename current file
function! Rename()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

map <Leader>r :call Rename()<CR>

" load the plugin and indent settings for the detected filetype
filetype plugin indent on
