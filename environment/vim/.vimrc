syntax on
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
execute pathogen#infect()
nmap <F8> :TagbarToggle<CR>
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
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

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

