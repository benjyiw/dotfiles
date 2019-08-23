"" enable pathogen
execute pathogen#infect()

syntax on

"" fix backspace issue
set backspace=indent,eol,start

set ruler

" bashlike filepath tab completion in exec mode
set wildmode=longest,list,full
set wildmenu

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

