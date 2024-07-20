" basic vim settings (tab width, line numbers, etc)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showtabline=2
set number
set expandtab
set encoding=UTF-8
set hlsearch
set incsearch
set cursorline
set relativenumber

" install vim-plug if it's not installed already
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin()
Plug 'yegappan/lsp'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'alx741/vim-rustfmt'
Plug 'arcticicestudio/nord-vim'
Plug 'spf13/vim-autoclose'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'valloric/MatchTagAlways'
Plug 'preservim/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " requires nodejs and yarn installed
Plug 'alvan/vim-closetag'
Plug 'normen/vim-pio'
call plug#end()

colorscheme nord

" airline should detect the theme automatically but just in case
let g:airline_theme='nord'

" Keybindings for tab management
map <C-z> :tabp<CR>
map <C-x> :tabn<CR>
map <C-c> :tabnew<CR>

" keybinding for removing search highlights
nnoremap \\ :noh<CR>

" NERDTree settings
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '<'

" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" save/quit
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>

" YCM settings
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_rust_toolchain_root = "/home/yashkarandikar/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/"
" let g:ycm_clear_inlay_hints_in_insert_mode = 1
" nnoremap <C-h> <Plug>(YCMToggleInlayHints)

" lsp/completer settings
let lspOpts = #{filterCompletionDuplicates: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [#{
	\    name: 'rustlang',
	\    filetype: ['rust'],
	\    path: '/usr/lib/rustup/bin/rust-analyzer',
	\    args: [],
	\    syncInit: v:true,
    \    initializationOptions: #{
    \       inlayHints: #{
    \           typeHints: #{
    \               enable: v:true
    \           },
    \           parameterHints: #{
    \               enable: v:true
    \           }
    \       },
    \    }
	\  }]
autocmd User LspSetup call LspAddServer(lspServers)
" tab completion
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Don't autoclose quotes in vim files
let g:autoclose_vim_commentmode = 1

" smart search
set ignorecase
set smartcase

" nerdcommenter settings
filetype plugin on
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
nnoremap <C-_> :call nerdcommenter#Comment('n', 'invert')<CR>
nnoremap <C-B> :call nerdcommenter#Comment('x', 'invert')<CR>
nnoremap <C-S-a> :call nerdcommenter#Comment('n', 'append')<CR>

" markdown preview settings
nnoremap <C-p> :MarkdownPreviewToggle<CR>

nnoremap ` ~
