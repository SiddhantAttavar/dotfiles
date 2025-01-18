" Key mapping
" Window mapping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> :wqa!<CR>

" NERDTree Explorer
nnoremap <C-b> :NERDTreeToggle<CR>

" Saving
nnoremap <C-s> :wa!<CR>

" Tab navigation
nnoremap <C-w> :w<CR> :bd<CR>
nnoremap <C-t> :enew<CR>
nnoremap <S-J> :w<CR> :bn<CR>
nnoremap <S-K> :w<CR> :bp<CR>

" Copy-pasting
nnoremap <C-v> "+p

" Fuzzy File Search
nnoremap <C-p> :Files<CR>

" Competitive programming
" nnoremap <C-r> :Test<CR>
nnoremap <C-r> :!python %<CR>
