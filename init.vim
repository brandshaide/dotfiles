
syntax on
filetype plugin indent on

set nocompatible
set number
set nowrap
set noshowmode
set tw=80
set formatprg=par
set pumheight=12
set conceallevel=0
set smartcase

set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set vb
set nofoldenable

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox,.stack-work
set wildmode=longest,list,full
set wildmenu

set cmdheight=1

call plug#begin('~/.vim/plugged')

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'

" Terminal
Plug 'kassio/neoterm'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" Comments
Plug 'scrooloose/nerdcommenter'

" Nerd Tree Git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" JSON
Plug 'tpope/vim-jdaddy'

" Repeat
Plug 'tpope/vim-repeat'

" Tabular
Plug 'godlygeek/tabular'

" Git
Plug 'tpope/vim-fugitive'

" Surround
Plug 'tpope/vim-surround'

" Haskell formatting
Plug 'sdiehl/vim-ormolu'

" Utilities
Plug 'tomtom/tlib_vim'

" Commenting
Plug 'tpope/vim-commentary'

" JavaScript

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'


" ----------------------------------------------
" Rust
" ----------------------------------------------

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

Plug 'rust-lang-nursery/rustfmt'

call plug#end()

" ----------------------------------------------
" Snippets
" ----------------------------------------------

:imap <C-J> <Plug>snipMateNextOrTrigger
:smap <C-J> <Plug>snipMateNextOrTrigger

" ----------------------------------------------
" Colors
" ----------------------------------------------

colorscheme NeoSolarized
""if strftime("%H") < 20
""  set background=light
""else
set background=dark
""endif

" ----------------------------------------------
" Terminal
" ----------------------------------------------

tnoremap <Esc> <C-\><C-n>

" ----------------------------------------------
" Colors
" ----------------------------------------------

set termguicolors
set t_Co=256

" ----------------------------------------------
" Tab Completion
" ----------------------------------------------

set completeopt=menuone,menu,longest
set completeopt+=longest

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" ----------------------------------------------
" CTRL+P
" ----------------------------------------------

map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ----------------------------------------------
"  NerdTree
" ----------------------------------------------

map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$','.stack-work','*.swp']
let g:NERDTreeChDirMode = 2

" ----------------------------------------------
"  Indentation
" ----------------------------------------------

map <Leader>ig :IndentGuidesToggle<CR>

" ----------------------------------------------
" Fix trailing Whitespace
" ----------------------------------------------

" Autofix all whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e
" Delete all trailing empty lines on files
autocmd BufWritePre *.py :%s/\(\s*\n\)\+\%$//e

" Autofix all whitespace on save
autocmd BufWritePre *.hs :%s/\s\+$//e
" Delete all trailing empty lines on files
autocmd BufWritePre *.hs :%s/\(\s*\n\)\+\%$//e
"
" ----------------------------------------------
" Nightmode
" ----------------------------------------------

" ----------------------------------------------
" GUI Options
" ----------------------------------------------

set mouse=a
set mousemodel=popup

set guioptions-=m
set guioptions-=r
set guioptions-=T
set guioptions-=L

set wildmenu
set wildmode=longest:list

set dictionary="/usr/dict/words"

" ----------------------------------------------
" Flush
" ----------------------------------------------

" Flush swap files recursively in this directory, usefull if Vim
" crashes.
command! Flush :call Flush()
func! Flush()
  exec "!find . -name \".*.swp\" | xargs rm -f"
endfunc

" ----------------------------------------------
" HTML
" ----------------------------------------------

let g:mta_use_matchparen_group = 1

" ----------------------------------------------
" Haskell
" ----------------------------------------------

let g:ormolu_options=["--unsafe", "-o -XTypeApplications"]
"let g:ormolu_disable=1
nnoremap tf :call RunOrmolu()<CR>
nnoremap to :call ToggleOrmolu()<CR>
xnoremap tb :<c-u>call OrmoluBlock()<CR>

let $PATH = $PATH . ':' . expand('~/.stack/bin')

" Type Lookup
map tt :call GHC_ShowType(0)<CR>

" Type Insertion
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

au FileType haskell nnoremap <buffer> <F1> :GhcModType<CR>
au FileType haskell nnoremap <buffer> <F2> :GhcModTypeClear<CR>

function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

nmap <silent> <leader>hl :SyntasticCheck hlint<CR>

" ----------------------------------------------
" Syntastic
" ----------------------------------------------

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell'] }

" ----------------------------------------------
" Python
" ----------------------------------------------

autocmd bufnewfile,bufread *.py set formatprg=par

" ----------------------------------------------
" Other Languages
" ----------------------------------------------

autocmd BufNewFile,BufRead *.y set filetype=happy
autocmd BufNewFile,BufRead *.x set filetype=alex
autocmd BufNewFile,BufRead *.agda set filetype=agda
autocmd BufNewFile,BufRead *.idr set filetype=idris
autocmd BufNewFile,BufRead *.ocaml set filetype=ocaml
autocmd BufNewFile,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.ll set filetype=llvm
autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd BufNewFile,BufRead *.c set filetype=c
autocmd BufNewFile,BufRead *.ws set filetype=wist

" ----------------------------------------------
" Pane Switching
" ----------------------------------------------

nnoremap <C-j> <C-W>w

nnoremap <C-j> <C-W>w

" tab navigation like firefox
map tn :tabnext<CR>
map tp :tabprevious<CR>

map <C-t> :tabnew<CR>

highlight SpellBad term=underline gui=underline guisp=Blue
highlight Error term=underline gui=underline guibg=#00ff00

"------------------------------------------------------------
" Window split
"------------------------------------------------------------

" Make splits equal size
noremap <silent> <F12> :wincmd =<CR>
autocmd VimResized * wincmd =

" ----------------------------------------------
" Autocorect
" ----------------------------------------------

ab teh the
ab sefl self
ab equivelant equivalent

" ----------------------------------------------
" Tabularize
" ----------------------------------------------

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a, :Tabularize /,<CR>
vmap a- :Tabularize /-><CR>

" ----------------------------------------------
" Git Version Traversal
" ----------------------------------------------

map gd :Gdiff<CR>
map gb :Gblame<CR>

" Git checkout at block level
vmap do :diffget<CR>
map gd :Gdiff<CR>

" ----------------------------------------------
" Fast Navigation
" ----------------------------------------------

" Go to last edited line one keystroke
map ` g;
map gl <C-^>

" ----------------------------------------------
" Searching
" ----------------------------------------------

set incsearch
map ff /\c

if &t_Co > 2 || has("gui_running")
  set hlsearch                "Highlight all search matches if color is
endif                           "possible (:noh to toggle off)
nnoremap <silent> <return> :noh<return>

" ----------------------------------------------
" Inactive Buffers
" ----------------------------------------------

function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" ----------------------------------------------
" Writing Mode
" ----------------------------------------------

autocmd BufNewFile,BufRead *.rst,*.txt,*.tex,*.latex,*.md setlocal spell
autocmd BufNewFile,BufRead *.rst,*.txt,*.tex,*.latex,*.md setlocal nonumber

" ----------------------------------------------
" Clipboard
" ----------------------------------------------

set clipboard+=unnamedplus
set showmode
set shellslash
set showmatch

" ----------------------------------------------
"  Rust 
" ----------------------------------------------
"

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["texDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

