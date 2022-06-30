"plugins
if has("python3")
    if &compatible
        set nocompatible
    endif
    " Add the dein installation directory into runtimepath
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

    if dein#load_state('~/.cache/dein')
        call dein#begin('~/.cache/dein')

        call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
        call dein#add('prabirshrestha/asyncomplete.vim')
        call dein#add('prabirshrestha/asyncomplete-lsp.vim')
        call dein#add('Yggdroot/indentLine')
        call dein#add('itchyny/lightline.vim')
        call dein#add('tomasr/molokai')
        call dein#add('preservim/nerdtree')
        call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0 })
        call dein#add('tpope/vim-commentary')
        call dein#add('prabirshrestha/vim-lsp')
        call dein#add('mattn/vim-lsp-settings')

        call dein#end()
    endif

    filetype plugin indent on
    syntax enable

    if dein#check_install()
        call dein#install()
    endif
else
    filetype plugin indent on
    syntax enable
endif

"basic settings
set fenc=utf-8
set noswapfile
set autoread
set hidden
set showcmd
set scrolloff=3
set vb t_vb=

"visual
set nocompatible
set number
set cursorline
set ruler
set laststatus=2
set noshowmode

"feature
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set showmatch
set backspace=indent,eol,start
set virtualedit=onemore
set nospell
if has('vim_starting')
    let &t_SI .= "\e[6 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
elseif exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'"

"search
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wrapscan

"mapping
nnoremap <silent><ESC><ESC> :<C-u>set nohlsearch!<CR>
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap sh :tab terminal<CR>
nnoremap <C-t> :tabe .<CR>

inoremap <silent> jj <ESC>
inoremap { {}<Left>
inoremap {<Enter> {<CR>}<ESC><S-o>
inoremap () ()
inoremap ( ()<ESC>i
inoremap (<Enter> (<CR>)<ESC><S-o>
inoremap (jj (<ESC>
inoremap [ []<ESC>i
inoremap [<Enter> [<CR>]<ESC><S-o>
inoremap [] []
inoremap [jj [<ESC>
inoremap '' ''
inoremap ' ''<ESC>i
inoremap 'jj '<ESC>
inoremap "" ""
inoremap " ""<ESC>i
inoremap "jj "<ESC>

inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

"syntax
autocmd BufNewFile,BufRead *.launch set filetype=xml

"debug
packadd termdebug
set mouse=a
let g:termdebug_wide = 1

"asyncomplete
let g:asyncomplete_auto_completeopt = 0
let g:lsp_diagnostics_echo_cursor = 1
set completeopt=menuone,noinsert,noselect,preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
nnoremap <C-i> :LspHover<CR>
imap <C-Space> <Plug>(asyncomplete_force_refresh)

"indentLine
let g:indentLine_char = '┆' "use ¦, ┆ or │
autocmd BufNewFile,BufRead *.json let g:indentLine_setConceal = 0

"lightline
let g:lightline={
            \'colorscheme':'wombat'
            \}

"color
colorscheme molokai
set t_Co=256
hi MatchParen cterm=bold ctermbg=none ctermfg=27
hi Visual ctermbg=53

"nerdtree
map <C-n> :NERDTreeToggle<CR>

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,  -- syntax highlightを有効にする
    disable = {     -- 一部の言語では無効にする
    }
  },
  ensure_installed = 'all', -- :TSInstall allと同じ
  -- ensure_installed = 'maintained' とすることもできる
}
EOF
