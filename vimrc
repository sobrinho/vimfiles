" colors
syntax on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let ayucolor="dark"
colorscheme ayu

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

" Enable mouse bindings
" set mouse=a

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
"
" See: http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
set viminfo='10,\"100,:20,%,n~/.viminfo

" Jump to last position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

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

let g:ruby_heredoc_syntax_filetypes = {
        \ "graphql" : {
        \   "start" : "GRAPHQL\|GQL",
        \},
  \}

" FZF
set rtp+=/usr/local/opt/fzf

map <Leader>f :GFiles --cached --others --exclude-standard<CR>
map <Leader>b :Buffers<CR>

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
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

" indentLine
let g:indentLine_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

autocmd FileType json :IndentLinesDisable

" Vue
"
" This is because Vim tries to highlight text in an efficient way.
" Especially in files that include multiple languages, it can get confused.
autocmd FileType vue syntax sync fromstart

" Disable autocomplete for sql files
"
" https://github.com/SpaceVim/SpaceVim/issues/1714
let g:omni_sql_no_default_maps = 1

" Markdown
let g:markdown_fenced_languages = ['ruby', 'bash=sh']

" Folding
set foldmethod=syntax
set foldlevel=99
