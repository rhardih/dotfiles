"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
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
highlight ColorColumn ctermbg=DarkGray


augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType html,php,htmldjango,eruby runtime! ftplugin/html/sparkup.vim
augroup END

set pastetoggle=<C-o>

"" Highlight lines more than 80 characters wide:
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Make vim-css-color pickup scss and sass files
autocmd FileType sass,scss,stylus syn cluster sassCssAttributes add=@cssColors

" CommandT settings
let g:CommandTMaxHeight=12
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxFiles=40000

" Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline

" MacVim
" Disable scrollbars
set guioptions-=r " Right-hand scrollbar is always present.
set guioptions-=R " Right-hand scrollbar is present when there is a vertically split window.
set guioptions-=l " Left-hand scrollbar is always present.
set guioptions-=L " Left-hand scrollbar is present when there is a vertically split window.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>l :call RunTestFile()<cr>
noremap <leader>; :call RunNearestTest()<cr>
noremap <leader>o :call RunTests('')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        let t:grb_test_file = AlternateForCurrentFile()
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename

    if filereadable(a:filename)
      :w
    end

    if match(a:filename, '_test\.rb$') != -1
        exec ":!testrb -Itest -I. " . a:filename
    else
        exec ":!bundle exec rspec " . a:filename
    end
endfunction
