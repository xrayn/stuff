syntax on
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set colorcolumn=110
set nu
highlight ColorColumn ctermbg=darkgray
set autoindent
set cindent
set exrc
set hlsearch
execute pathogen#infect()
nmap <F8> :TagbarToggle<CR>
nmap <F5> :!make clean && make<CR>
map <C-n> :NERDTreeToggle<CR>
set secure
set t_Co=256
"let g:solarized_termcolors=256
colorscheme molokai
"set background=dark
"colorscheme solarized
set whichwrap+=<,>,h,l,[,]


set laststatus=2
set nocscopeverbose

noremap <C-b>n :tabnext<CR>
noremap <C-b>p :tabprevious<CR>
noremap <C-b>c :tabnew<CR>
noremap <C-b>x :tabclose<CR>

noremap <C-b>s :bufdo tab split<CR>:syntax on<CR>
"Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
"
highlight Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
highlight PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE
"highlight Pmenu ctermbg=13 guibg=LightGray
"highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
"highlight PmenuSbar ctermbg=7 guibg=DarkGray
"highlight PmenuThumb guibg=Black

" Enable global scope search
let OmniCpp_GlobalScopeSearch = 1
" Show function parameters
let OmniCpp_ShowPrototypeInAbbr = 1
" Show access information in pop-up menu
let OmniCpp_ShowAccess = 1
" Auto complete after '.'
let OmniCpp_MayCompleteDot = 1
" Auto complete after '->'
let OmniCpp_MayCompleteArrow = 1
" Auto complete after '::'
let OmniCpp_MayCompleteScope = 0
" Don't select first item in pop-up menu
let OmniCpp_SelectFirstItem = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '>>>'
let g:airline_powerline_fonts = 1
"" This is a fix for wrapping in WSL
"set ambiwidth=double
" some fixes
"let g:airline_symbols = {}
"let g:airline_symbols.maxlinenr = ''

" This is for python3 support
"
"autocmd FileType python set omnifunc=python3complete#Complete
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers = ['gcc', 'make']
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_enable_highlighting = 1


" some NERDTree stuff

let NERDTreeMinimalUI = 1

" If linux kernel coding style plugin is used
" force plugin to only be active on certain folders
"
"let g:linuxsty_patterns = [ "/linux/", "/kernel/" ]

