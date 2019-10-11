call pathogen#infect()

syntax on
filetype plugin indent on
colorscheme sweyla873538
set smartindent 
set autoindent  
set expandtab   
set tabstop=2   
set shiftwidth=2
set ruler       
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*/vendor/*,*/doc/*,*/tmp/*,*/node_modules/*
set shell=/bin/sh
set colorcolumn=100
set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files
set textwidth=80
set showcmd         " shows length of selection

highlight ColorColumn ctermbg=DarkGray

set pastetoggle=<f5>

augroup vimrc_autocmds
  " Add red visual highlight of the 80th character on a line:
  highlight Col80 ctermbg=red ctermfg=white guibg=#592929
  match Col80 /\%80v\+/
augroup END

" Filetype aliases for highlighting
au BufRead,BufNewFile *.flex       set filetype=lex
au BufRead,BufNewFile *.html.tmpl  set filetype=html

"
" Macros
"

" Insert current date at the end of the current line
let @d=':r !date +\%Y-\%m-\%dkJ'


" CommandT settings
let g:CommandTMaxHeight=12
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxFiles=40000

" Vimux settings
map <leader>l :VimuxRunLastCommand<CR>
map <leader>i :VimuxInterruptRunner<CR>
map <leader>r :call VimuxRunCommand("reset")<CR>

" Fix for editing crontab
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Allow per folder .vimrc
set exrc

" Disable unsafe commands in per folder .vimrc's
set secure

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" Capitalization (like gu)
"
" http://vim.wikia.com/wiki/Capitalize_words_and_regions_easily
"
" "gcw        - capitalize word (from cursor position to end of word)
" "gcW        - capitalize WORD (from cursor position to end of WORD)
" "gciw       - capitalize inner word (from start to end)
" "gciW       - capitalize inner WORD (from start to end)
" "gcis       - capitalize inner sentence
" "gc$        - capitalize until end of line (from cursor postition)
" "gcgc       - capitalize whole line (from start to end)
" "gcc        - capitalize whole line
" "{Visual}gc - capitalize highlighted text
if (&tildeop)
	nmap gcw guw~l
	nmap gcW guW~l
	nmap gciw guiw~l
	nmap gciW guiW~l
  nmap gcaw guaw~l
  nmap gcaW guaW~l
	nmap gcis guis~l
	nmap gc$ gu$~l
	nmap gcgc guu~l
	nmap gcc guu~l
	vmap gc gu~l
else
	nmap gcw guw~h
	nmap gcW guW~h
	nmap gciw guiw~h
	nmap gciW guiW~h
  nmap gcaw guaw~h
  nmap gcaW guaW~h
	nmap gcis guis~h
	nmap gc$ gu$~h
	nmap gcgc guu~h
	nmap gcc guu~h
	vmap gc gu~h
endif
