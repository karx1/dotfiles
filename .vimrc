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
set modeline

" install vim-plug if it's not installed already
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins
call plug#begin()
Plug 'spf13/vim-autoclose'
Plug 'yegappan/lsp'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'alx741/vim-rustfmt'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'valloric/MatchTagAlways'
Plug 'preservim/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " requires nodejs and yarn installed
Plug 'alvan/vim-closetag'
Plug 'normen/vim-pio'
Plug 'mhinz/vim-signify'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html', 'javascriptreact', 'typescriptreact'] }
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
let g:NERDTreeIgnore = ['\.class[[file]]', '\.o[[file]]']

" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" save/quit
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>

" lsp/completer settings
let lspOpts = #{filterCompletionDuplicates: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

" note: for the java server to work, the java version must be at least java 17.
let lspServers = [#{
    \    name: 'rustlang',
    \    filetype: ['rust'],
    \    path: '/usr/lib/rustup/bin/rust-analyzer',
    \    args: [],
    \    syncInit: v:true,
    \    initializationOptions: #{
    \       check: #{
    \           command: "clippy"
    \       },
    \       inlayHints: #{
    \           typeHints: #{
    \               enable: v:true
    \           },
    \           parameterHints: #{
    \               enable: v:true
    \           }
    \       },
    \    }
    \  },
    \ #{
    \    name: 'jdtls',
    \    filetype: ['java'],
    \    path: '/sbin/jdtls',
    \    args: [],
    \    syncInit: v:true,
    \ },
    \ #{name: 'pyright',
    \   filetype: 'python',
    \   path: '/sbin/pyright-langserver',
    \   args: ['--stdio'],
    \   workspaceConfig: #{
    \       python: #{
    \           pythonPath: '/usr/bin/python'
    \       },
    \   },
    \ },
    \ #{
    \    name: 'clangd',
    \    filetype: ['c', 'cpp'],
    \    path: '/sbin/clangd',
    \    args: ['--background-index', '--clang-tidy', '--enable-config'],
    \    syncInit: v:true,
    \ },
    \ #{name: 'tsserver',
    \   filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
    \   path: '/sbin/typescript-language-server',
    \   args: ['--stdio'],
    \ }]
autocmd User LspSetup call LspAddServer(lspServers)

nnoremap <C-{> :LspCodeAction
nnoremap <C-.> :LspDiag show
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

" vim-signify settings
set updatetime=100

nnoremap ` ~

" settings for editing java files
au BufRead,BufNewFile *.java setlocal textwidth=100
au BufRead,BufNewFile *.java setlocal colorcolumn=100

" let java_highlight_functions = 1
let java_highlight_all = 1
highlight link javaScopeDecl Statement
highlight link javaType Type
" highlight link javaDocTags PreProc

" rustfmt settings
let g:rustfmt_edition = '2024'

" prettier settings
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" closetag settings
let g:closetag_filenames = "*.html,*.jsx,*.tsx,*.xml"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
