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
