" ~/.vimrc

"" enable pathogen
execute pathogen#infect()

"" colors mmm
syntax on
colorscheme peachpuff

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

" bashlike filepath tab completion in exec mode
set wildmode=longest,list,full
set wildmenu


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

