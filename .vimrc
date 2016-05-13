call pathogen#infect()
call pathogen#helptags()

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

"set lisp
highlight ColorColumn ctermbg=DarkGray

augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType html,php,htmldjango,eruby runtime! ftplugin/html/sparkup.vim
augroup END

set pastetoggle=<f5>

augroup vimrc_autocmds
  "" Highlight lines more than 80 characters wide:
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
augroup END

" Filetype aliases for highlighting
au BufRead,BufNewFile *.html.curly set filetype=html
au BufRead,BufNewFile *.flex       set filetype=lex

"
" Macros
"

" Insert current date at the end of the current line
let @d=':r !date +\%Y-\%m-\%dkJ'


" CommandT settings
let g:CommandTMaxHeight=12
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxFiles=40000

" Turbux settings
let g:no_turbux_mappings = "true"
let g:turbux_command_prefix = 'bundle exec'
map <leader>s <Plug>SendTestToTmux
map <leader>S <Plug>SendFocusedTestToTmux

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

" Auto insert single and double quotes, as well as skip over closing
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

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
