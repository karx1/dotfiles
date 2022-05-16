" basic vim settings (tab width, line numbers, etc)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showtabline=2
set number
set expandtab
set encoding=UTF-8

" install vim-plug if it's not installed already
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin()
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'alx741/vim-rustfmt'
Plug 'arcticicestudio/nord-vim'
Plug 'spf13/vim-autoclose'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme nord

" airline should detect the theme automatically but just in case
let g:airline_theme='nord'

" Keybindings for tab management
map <C-z> :tabp<CR>
map <C-x> :tabn<CR>
map <C-c> :tabnew<CR>

" NERDTree settings
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '<'

" save/quit
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
command Dw :w !sudo tee %

" YCM settings
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_rust_toolchain_root = "/home/yashkarandikar/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/"

" Don't autoclose quotes in vim files
let g:autoclose_vim_commentmode = 1
