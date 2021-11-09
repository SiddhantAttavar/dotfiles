" Key mapping
" Window mapping
nnoremap  <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap  <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> :wqa!<CR>

" NERDTree Explorer
nnoremap <C-b> :NERDTreeToggle<CR>

" Saving
nnoremap <C-s> :wa!<CR>

" Babar
nnoremap <Tab> :BufferNext<CR>
nnoremap <S-Tab> :BufferPrevious<CR>
nnoremap <C-w> :BufferClose<CR>
nnoremap <C-t> :tabnew<CR>:wincmd p<CR>

" Fuzzy File Search
nnoremap <C-p> :Files<CR>

" Competitive programming
nnoremap <C-r> :Test<CR>
