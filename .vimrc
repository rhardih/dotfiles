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
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*/vendor/*,*/doc/*,*/tmp/*
set shell=/bin/sh

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
        exec ":!bundle exec testrb -Itest -I. " . a:filename
    else
        if a:filename == ""
            let args = "--format Fuubar"
        else
            let args = "--color"
        end

        exec ":!rspec " . args . " " . a:filename
    end
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let lib_name = substitute(getcwd(), '^/.\+/', '', '')
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    else
      let new_file = substitute(new_file, '^lib/' . lib_name . '/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = substitute(new_file, '\.html\.erb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let going_to_view = match(current_file, '\<views\>') != -1
    if going_to_view
      let new_file = substitute(new_file, '_spec\.rb$', '.html.erb', '')
    else
      let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    end

    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    else
      let new_file = 'lib/' . lib_name . '/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap ,, :call OpenTestAlternate()<CR>
