execute pathogen#infect()
syntax on
filetype plugin indent on

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'Konfekt/FastFold'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/editorconfig/editorconfig-vim.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'srcery-colors/srcery-vim'
Plug 'liuchengxu/vista.vim'
Plug 'preservim/nerdcommenter'
Plug 'OmniSharp/omnisharp-vim'
Plug 'voldikss/vim-floaterm'


call plug#end()

" Always show statusline
set laststatus=2

set number 
set hlsearch
set relativenumber
set showcmd
set expandtab
set tabstop=2
set shiftwidth=2

nmap <esc> :silent! nohls<cr>

" for jsx
autocmd FileType javascript.jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for JS
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>

" " for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" " for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}



autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista_update_on_text_changed=1

map <Leader>v :call vista#finder#fzf#Run()<CR>

let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \}
let g:lightline = {
  \   'colorscheme': 'srcery',
  \   'active': {
  \     'left':[ [ 'mode', 'paste', 'vista' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \     'vista': 'NearestMethodOrFunction'
  \   },
  \ }


let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline



set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
"map <C-g> :NERDTreeToggle<CR>

" syntax enable
set background=dark
" let g:solarized_termcolors=256
colorscheme srcery
set t_Co=256
set termguicolors
if (has('termguicolors'))
  set termguicolors
endif


let g:user_emmet_expandabbr_key = '<C-e>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}


" let g:ale_linters = {
" \  'javascript': ['eslint'],
" \  'jsx': ['eslint'],
" \  'typescript': ['tslint'],
" \  'python': ['','pylint']
" \}

" let g:ale_fixers = {
" \  'javascript': ['eslint', ],
" \  'typescript': ['tslint'],
" \  'jsx': ['prettier','eslint'],
" \  'python': ['autopep8','yapf'],
" \  'css': ['prettier']
" \}

" let g:ale_sign_column_always = 1
" let g:ale_fix_on_save = 1


" Autofix entire buffer with eslint_d:
nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F
" Autofix visual selection with eslint_d:
nnoremap <leader>f :!eslint_d --stdin --fix-to-stdout<CR>

" ripgrep && fzf
let g:rg_command = "
  \ rg --column --line-number --no-heading --no-fixed-strings --regexp --ignore-case --no-ignore --hidden --follow --color='always'
  \ --glob '!{.git,node_modules,vendor,.fusebox,.idea,tmp}/*' "

nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
"command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \ "rg --column --line-number --no-heading --no-fixed-strings --ignore-case --hidden --follow --color=always --glob '!{.git,node_modules,vendor,.fusebox,.idea,tmp}/*' ".shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},'up:60%')
      \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},'right:50%', '?'),
      \   <bang>0)

set wildchar=<Tab> 
" Default on nvim
set wildmenu 
set wildmode=full
"""""""""""
set wildcharm=<C-z>
" buffer
nnoremap <Leader>b :b <C-z>

" folding 
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" copy/paste using register
nnoremap p "0p

" copy to clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")


" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>t  <Plug>(coc-format-selected)
nmap <leader>t  <Plug>(coc-format-selected)
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')



" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

source ~/.vim_snippet

"let g:floaterm_width = 100
let g:floaterm_position = 'topright'
let g:floaterm_winblend = 0
let g:floaterm_width = 0.4

noremap  <leader>t  :FloatermToggle<CR>
tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>
