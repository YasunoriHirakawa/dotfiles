"deoplete
if has("python3")
    if &compatible
        set nocompatible
    endif
    " Add the dein installation directory into runtimepath
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

    if dein#load_state('~/.cache/dein')
        call dein#begin('~/.cache/dein')

        call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
        call dein#add('Shougo/deoplete.nvim')

        if !has('nvim')
          call dein#add('roxma/nvim-yarp')
          call dein#add('roxma/vim-hug-neovim-rpc')
        endif

        call dein#end()
        call dein#save_state()
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

"setting
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

"search
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wrapscan

"mapping
inoremap <silent> jj <ESC>
nnoremap <silent><ESC><ESC> :<C-u>set nohlsearch!<CR>
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap sh :tab terminal<CR>
nnoremap <C-t> :tabe .<CR>

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
set completeopt=menuone,noinsert
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

"nerdtree
map <C-n> :NERDTreeToggle<CR>

"deoplete
let g:deoplete#enable_at_startup=1

"lightline
let g:lightline={
            \'colorscheme':'wombat'
            \}

"color
colorscheme molokai
set t_Co=256
hi MatchParen cterm=none ctermbg=none ctermfg=blue

"indentLine
let g:indentLine_char = '┆' "use ¦, ┆ or │
autocmd BufNewFile,BufRead *.json let g:indentLine_setConceal = 0

"syntax
autocmd BufNewFile,BufRead *.launch set filetype=xml
