
"""""" Nvim settings ~~

set clipboard=unnamedplus " Use system clipboard
set relativenumber		  " Numbers relative current row
set number				  " Add numbers of row on the left side of rows
set encoding=utf-8        " Understand all symbols
set shiftwidth=4		  " How much space will take shift buttom
set tabstop=4		      " Tab character appears 4 character cells
set ai				      " Set auto-indentation
syntax on				  " Set nvim syntax

"""""" Plugins is our everything
call plug#begin("~/.vim/plugged")

" File manager
Plug 'preservim/nerdtree'
" Smart commenter (SLASH + C + SPACE)
Plug 'preservim/nerdcommenter'
" Icons
Plug 'ryanoasis/vim-devicons'
" Color theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" Auto-pairs
Plug 'jiangmiao/auto-pairs'
" Vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Python Syntax 
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""""" Colorscheme
colorscheme catppuccin

"""""" Nerdtree
" Start NERDTree and put the cursor back in the other window.
" Enter NERDTree (CTRL + B)
nnoremap <C-B> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

"""""" Clean buffs alias
:command ClBufs :%bd|e#|bd#

"""""" Airline
" Smart tablines
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='lessnoise'

"""""" CoC
" Tab autocompletion
inoremap <expr><Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

" Apply autocompletion with enter
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"""""" Extensions of Coc
" JS, Python, Snippet support
let g:coc_global_extensions = [
	\ 'coc-tsserver',
	\ 'coc-pyright',
	\ 'coc-snippets'
	\ ]

"""""" Semshi (Python syntax)
let g:semshi#error_sign_delay = 1
" Rename multiple names in Python code (CTRL + R)
nmap <silent> <leader>r :Semshi rename<CR>

"""""" Start Python code (CTRL + X)
autocmd FileType python map <buffer> <C-X> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
