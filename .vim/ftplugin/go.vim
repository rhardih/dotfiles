map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vg :wa<CR> :call VimuxSendKeys("C-c") <CR> :call VimuxRunCommand("go run .") <CR>
map <Leader>vc :wa<CR> :call VimuxSendKeys("C-c") <CR> :call VimuxRunCommand("dc stop app && dc up app") <CR>
map <Leader>vt :wa<CR> :call VimuxSendKeys("C-c") <CR> :call VimuxRunCommand("go test ./...") <CR>
map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
map <Leader>rf :wa<CR> :GolangTestFocused<CR>
