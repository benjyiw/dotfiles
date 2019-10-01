" ~/.vimrc

"" enable pathogen
execute pathogen#infect()

"" colors mmm
syntax on
colorscheme peachpuff

"" bracket highlighting
highlight MatchParen cterm=none ctermbg=darkgray ctermfg=white

"" line highlighting
set cursorline
highlight LineNr term=underline ctermfg=1
highlight Cursorline cterm=NONE ctermfg=NONE term=underline
highlight CursorLineNr term=bold cterm=bold ctermfg=3 gui=bold

"" line numbering
set number

"" bind <C-@> to toggle number, because it's annoying sometimes
nmap <C-@> :set number! number?<CR>

"" whitespace characters for :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"" fix backspace issue
set backspace=indent,eol,start

"" ruler at the bottom right
set ruler

"" case insensitive searching
set ignorecase
set smartcase

"" scrolloff, prevent cursor from hitting the end of buffer
set scrolloff=6

"" bashlike filepath tab completion in exec mode
set wildmode=longest,list,full
set wildmenu

"" always show gutter for ale and git gutter
set signcolumn=yes


"""" Plugin Configurations

"" Map Nerdtree to CTRL+N
map <C-n> :NERDTreeToggle<CR>
"" Hide help button in NERDTree
let NERDTreeMinimalUI=1


"" Configure vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Align Github-flabored markdown tables (not sure if this works)
"au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>


"" ale syntax checking/linting
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" python
let g:ale_python_pylint_options = '--errors-only'
" cloudformation
let g:ale_cloudformation_cfnlint_options = '-a /Users/bweseman/cfn-custom-rules/'

"" lightline configuration
"" might want export TERM=xterm-256color
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }
" transparent middle bar
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

"" vim-commentary
" python
autocmd FileType python setlocal commentstring=#\ %s
