" ~/.vimrc

"" enable vim-plug
call plug#begin('~/.vim/plugged')

" Linter
Plug 'dense-analysis/ale'

" Easy commenter 'gc'
Plug 'tpope/vim-commentary'

" Distraction free vim
Plug 'junegunn/goyo.vim'

" Status line
Plug 'itchyny/lightline.vim'

" Nerdtree 
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

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

call plug#end()


"" required for vimwiki
set nocompatible
filetype plugin on

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

"" highlighted text should be visible
highlight Visual ctermfg=7 ctermbg=black

"" warnings from linters should be readable
highlight SpellBad ctermfg=black

"" less harsh colors for folds
highlight Folded ctermbg=8 ctermfg=7

"" remove color for gutter
highlight clear SignColumn

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

"" tab preferences by filetype
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype go setlocal ts=4


"""" Generic Bindings

"" bind <C-@> to toggle number, because it's annoying sometimes
nmap <C-@> :set number! number?<CR>

"" rebind + to be used for timestamping things quickly
nmap + o<C-R>=strftime("%Y-%m-%d %H:%M:%S %Z: ")<CR>
"" \+ bonus mapping because vimwiki overwrites usage of just +
nmap <Leader>+ o<C-R>=strftime("%Y-%m-%d %H:%M:%S %Z: ")<CR>

"" remap visual Y to copy to the system clipboard register 
"" because it's the same as y and it's a pain to access the register everytime
vmap Y "+y

"""" Plugin Configurations

"" Vimwiki configuration
" use markdown instead of .wiki syntax
let g:vimwiki_list = [{'path': '~/vimwiki/',
  \ 'syntax': 'markdown', 'ext': '.md'}]
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
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" python
let g:ale_python_pylint_options = '--errors-only'
" ignore E501 line too long
let g:ale_python_flake8_options = '--ignore=E501'
" cloudformation
if isdirectory(expand('~/cfn-custom-rules'))
    let g:ale_cloudformation_cfnlint_options = '-a ~/cfn-custom-rules/'
endif
" fixers
let g:ale_fixers = { 
    \ 'markdown': ['prettier'],
    \ 'json': ['prettier'],
    \ 'terraform': ['terraform'],
    \ 'python': ['autopep8', 'autoimport'],
    \ 'go': ['trim_whitespace', 'gofmt', 'goimports']
    \ }
let g:ale_javascript_prettier_options = '--prose-wrap=always'
let g:ale_fix_on_save = 0

"" lightline configuration
"" might want export TERM=xterm-256color
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'seoul256', }
" transparent middle bar
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

"" vim-terraform
let g:terraform_align=1

"" vim-commentary
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType tf setlocal commentstring=#\ %s

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


"""" custom commands and functions

" reload vimrc easily
command! Reloadvimrc source ~/.vimrc

function! InsertTextFile(filepath)
    exe '0r' . a:filepath
endfunction

" start a cloudformation template
function! Begincfnyaml(filepath)
    call InsertTextFile(a:filepath)
    set ft=yaml.cloudformation
endfunction
function! Begincfnjson(filepath)
    call InsertTextFile(a:filepath)
    set ft=json.cloudformation
endfunction
if isdirectory(expand('~/.vim/txt'))
    command! Begincfn call Begincfnyaml("~/.vim/txt/cloudformation-begin.yaml")
    command! Begincfnyaml call Begincfnyaml("~/.vim/txt/cloudformation-begin.yaml")
    command! Begincfnjson call Begincfnjson("~/.vim/txt/cloudformation-begin.json")
endif

" cleanup registrers when i have too much shit in them
command! CleanReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" run a file through jq to make the json pretty
command! FormatJson %!jq .
