" pathogen
execute pathogen#infect()

" colors
syntax on

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="dark"   " for dark version of theme
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

" style
set number
set relativenumber
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

" Enable mouse bindings
set mouse=a

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"
" See: http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
set viminfo='10,\"100,:20,%,n~/.viminfo

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
map <Leader>N :NERDTreeFind<CR>

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

" Ruby
imap <c-l> <space>=><space>

" RSpec
let g:rspec_command = "!bin/rspec {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" FZF
set rtp+=/usr/local/opt/fzf

map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Clear the search buffer when hitting space
nnoremap <space> :nohlsearch<CR>

" Do not jump on searching with * and #
nnoremap * :keepjumps normal! mi*`i<CR>
nnoremap # :keepjumps normal! mi#`i<CR>

" Keep visual selection while indenting with < and >
vnoremap < <gv
vnoremap > >gv

" Copy and paste from external clipboard with <leader>y and <leader>p
map <Leader>y "+yy
map <Leader>p "+p

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" IndentLine {{
let g:indentLine_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

map <Leader>i :IndentLinesToggle<CR>

" Vue
"
" This is because Vim tries to highlight text in an efficient way.
" Especially in files that include multiple languages, it can get confused.
autocmd FileType vue syntax sync fromstart

" Folding
"
" See https://vim.fandom.com/wiki/Folding
" augroup vimrc
  " au BufReadPre * setlocal foldmethod=indent
  " au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf

" Disable autocomplete for sql files
"
" https://github.com/SpaceVim/SpaceVim/issues/1714
let g:omni_sql_no_default_maps = 1
