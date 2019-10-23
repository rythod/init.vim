call plug#begin('~/.local/share/nvim/plugged')

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" GUI
Plug 'itchyny/lightline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'dracula/vim', {'as': 'dracula'}

" CORE
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" EXT
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dotenv'

" FORMAT / LINT
Plug 'w0rp/ale'

" MISC
Plug 'brooth/far.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-eunuch'

" SFTP
Plug 'skywind3000/asyncrun.vim'
Plug 'eshion/vim-sync'

" SNIPPETS
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'ncm2/ncm2'
Plug 'SirVer/ultisnips'

" SYNTAX
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

" DATABASE
function! s:env(var) abort
  return exists('*DotenvGet') ? DotenvGet(a:var) : eval('$'.a:var)
endfunction

let db_url = s:env('DATABASE_URL')

" FUZZY FINDER
map ; :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag -U --path-to-ignore ~/.ignore --hidden -l -g ""'

" NERDTREE
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
set wildignore+=*.DS_Store,Icon*
let NERDTreeRespectWildIgnore=1

" NUMBERS
let g:numbers_exclude = ['nerdtree']
au TermOpen * setlocal nonumber norelativenumber

" TERMINAL
let g:neoterm_default_mod = ':botright' 
let g:neoterm_size = 10
tnoremap <Esc> <C-\><C-n>

" MISC/QUALITY OF LIFE
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
set mouse=a
set clipboard=unnamed

" AUTOFORMATTING
let g:ale_linters = {
\ "javascript": ['prettier', 'eslint'],
\ "json": ['prettier', 'eslint'],
\ "css": ['prettier'],
\}
let g:ale_fixers = ['prettier']
let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1

" SNIPPETS
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" APPEARANCE/GUI
" set bg=dark
let g:lightline = {
  \     'colorscheme': 'wombat',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" <TAB>
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2

" WEBPACK
set backupcopy=yes " Disable 'safe write' feature
