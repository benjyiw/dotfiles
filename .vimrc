" ~/.vimrc

"""" plugins
""" {{{

"" enable vim-plug
call plug#begin('~/.vim/plugged')

" Linter
Plug 'dense-analysis/ale'

" Easy commenter 'gc'
Plug 'tpope/vim-commentary'

" Surround normal:'ys' 'cs' 'ds', visual:'S'
Plug 'tpope/vim-surround'

" Repeat for plugins
Plug 'tpope/vim-repeat'

" Distraction free vim
Plug 'junegunn/goyo.vim'

" Status line
Plug 'itchyny/lightline.vim'

" Nerdtree 
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

" Easy navigation between tmux panes and vim windows
Plug 'christoomey/vim-tmux-navigator'

" vim wiki, for all of the notes
Plug 'vimwiki/vimwiki'

" Markdown -- :help fold-commands
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'mzlogin/vim-markdown-toc'

Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/vim-easy-align'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" visual star search
Plug 'bronson/vim-visual-star-search'

" yaml folding because big yaml files are a bitch
Plug 'pedrohdz/vim-yaml-folds'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'sainnhe/everforest'

" outline
Plug 'preservim/tagbar'

" disable highlight after search
Plug 'romainl/vim-cool'

" sticky headers
Plug 'wellle/context.vim'

call plug#end()

""" }}}
"""" colors and highlighting
""" {{{

"" colors mmm
syntax on
if (has("termguicolors"))
  set termguicolors
endif
" set the colorscheme silently, so that we don't get errors if the
" colorschemes aren't installed
silent! colorscheme nord
"colorscheme peachpuff

"" line highlighting
set cursorline
"highlight LineNr term=underline ctermfg=1
highlight Cursorline cterm=NONE ctermfg=NONE term=underline
highlight CursorLineNr term=bold cterm=bold ctermfg=3 gui=bold

"" remove color for gutter
highlight clear SignColumn

""" }}}
"""" generic configurations
""" {{{

"" disable mouse bc nvim made it on by default
set mouse=

"" leader
let mapleader=" "

"" required for vimwiki
set nocompatible
filetype plugin on

"" set directory for centralizing swap files, to mitigate various problems
set directory=$HOME/.vim/swapfiles//

"" line numbering
set number

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

"" include hyphens with C-p
set iskeyword+=-

"" horizontal split always goes to the bottom
set splitbelow

"" virtical split always goes to the right
set splitright

""" }}}
"""" generic bindings
""" {{{

"" replace visual selection and keep paste register
xnoremap <Leader>p "_dP

"" bind <C-@> to toggle number, because it's annoying sometimes
nmap <C-@> :set number! number?<CR>

"" rebind + to be used for timestamping things quickly
nmap + o<C-R>=strftime("%Y-%m-%d %H:%M:%S %Z: ")<CR>
"" \+ bonus mapping because vimwiki overwrites usage of just +
nmap <Leader>+ o<C-R>=strftime("%Y-%m-%d %H:%M:%S %Z: ")<CR>

"" remap visual Y to copy to the system clipboard register 
"" because it's the same as y and it's a pain to access the register everytime
vmap Y "+y


""" }}}
"""" plugin configurations
""" {{{

"" coc
let g:coc_disable_startup_warning = 1
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-git',
  \ 'coc-go',
  \ 'coc-pyright',
  \ 'coc-angular'
  \ ]
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


"" fzf
"nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader><leader> :Files<CR>
nnoremap <leader>fi       :Files<CR>
nnoremap <leader>fl       :Lines<CR>
nnoremap <leader>aG       :Ag <C-R><C-W><CR>
nnoremap <leader>ag       :Ag 
nnoremap <leader>s        :Snippets<CR>
nnoremap <leader>m        :Marks<CR>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

"" fugitive mappings
nnoremap <leader>g :G<CR>
nnoremap <leader>G :tab G<CR>

"" Vimwiki configuration
" use markdown instead of .wiki syntax
let g:vimwiki_list = [{
  \ 'path': '~/vimwiki/',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'auto_diary_index': 1,
  \ 'links_space_char': '_'
  \ }]
" include extension in created links. allows markdown ease of use outside of vim
let g:vimwiki_markdown_link_ext = 1
" disable table mappings to allow for tab to work with ultisnips
let g:vimwiki_table_mappings = 0
" disable conceal for urls because vimbug vim/vim#260 :(
let g:vimwiki_url_maxsave = 0
" iterm doesn't send shift-enter, so add extra bindings as workaround
map <Leader><cr> <Plug>VimwikiTabnewLink
map <Leader>ws <Plug>VimwikiSplitLink
" automatically enter the date at the top of diary files
autocmd BufNewFile ~/vimwiki/diary/[0-9]*.md :silent 0r !echo "\# `date +'\%Y-\%m-\%d'`"

"" Map Nerdtree to CTRL+N
map <C-n> :NERDTreeToggle<CR>
"" Hide help button in NERDTree
let NERDTreeMinimalUI=1
" Start NerdTree when no files are opened
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
"disabled because it turns out i hate it
"autocmd VimEnter * call StartUp()

"" Configure vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Align Github-flavored markdown tables (not sure if this works)
"au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

"" ale syntax checking/linting
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
" ale completion
" disable completion for now while i'm trying out coc
let g:ale_completion_enabled = 0
set omnifunc=ale#completion#OmniFunc
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" python
let g:ale_python_pylint_options = '--errors-only'
" ignore E501 line too long
let g:ale_python_flake8_options = '--ignore=E501'
" linters
let g:ale_linters = {
    \ 'terraform': ['terraform_ls']
    \ }
" fixers
let g:ale_fixers = { 
    \ 'markdown': ['prettier'],
    \ 'json': ['prettier'],
    \ 'yaml': ['prettier'],
    \ 'terraform': ['terraform'],
    \ 'python': ['autopep8', 'autoimport'],
    \ 'go': ['trim_whitespace', 'gofmt', 'goimports'],
    \ 'javascript': ['prettier']
    \ }
let g:ale_javascript_prettier_options = '--prose-wrap=always'
let g:ale_fix_on_save = 0
" mappings for ale
nnoremap <leader>af :ALEFix<CR>

"" lightline configuration
"" might want export TERM=xterm-256color
set laststatus=2
set noshowmode
"let g:lightline = { 'colorscheme': 'seoul256', }
let g:lightline = { 'colorscheme': 'nord', }

"" vim-terraform
let g:terraform_align=1

"" vim-go
"" disable shift-K go doc, because COC's is nicer
let g:go_doc_keywordprg_enabled=0

"" vim-commentary
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType tf setlocal commentstring=#\ %s

"" snippets ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-d>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"
let g:UltiSnipsEditSplit="horizontal"

"" yaml folds
" unfold by default
au BufRead *.yml normal zR
au BufRead *.yaml normal zR

"" context.vim
" hide the context.vim tag
let g:context_highlight_tag = '<hide>'


""" }}}
"""" custom commands and functions
""" {{{

"" cucumbertables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"" transparent background, because some themes have annoying backgrounds
function! RemoveBackground()
  highlight Normal guibg=NONE ctermbg=NONE
endfunction
command! NoBackground :call RemoveBackground()

" reload vimrc easily
command! Reloadvimrc source ~/.vimrc

" cleanup registrers when i have too much shit in them
command! CleanReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" run a file through jq to make the json pretty
command! FormatJson %!jq .

""" }}}
