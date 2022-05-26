" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Babar configuration
let bufferline.tabpages = v:true
let bufferline.animation = v:true
let bufferline.auto_hide = v:true
let bufferline.closable = v:true
let bufferline.clickable = v:true

" Offset the tabs for filetree
" autocmd VimEnter * lua require'bufferline.state'.set_offset(31, 'FileTree')
