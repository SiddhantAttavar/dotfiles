-- General settings
-- Enable line numbers and word wrapping
vim.o.number = true
vim.o.relativenumber = true
vim.o.linebreak = true

-- Indentation settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 0 
vim.o.expandtab = false
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cindent = true

-- Terminal
if not vim.fn.has('win32') then
	vim.o.shell = 'zsh'
end

-- Spell check and dictionary completion
vim.api.nvim_create_autocmd('FileType', {
	pattern = {'markdown', 'text', 'tex', 'gitcommit'},
	command = 'setlocal spell | set spellsuggest=best,5 | setlocal complete+=kspell'
})
vim.api.nvim_create_autocmd('BufLeave', {
	pattern= {'bash*', 'zsh*'},
	command = 'setlocal nobuflisted'
})

-- Copy/paste from system clipboard
vim.o.clipboard = 'unnamedplus'

-- General UI/UX
vim.o.mouse = 'a'
vim.o.termguicolor = true

-- Text encoding settings
vim.o.encoding = 'UTF-8'
vim.o.fileformat = 'unix'

-- Buffer management
vim.o.splitright = true
vim.o.hidden = true
vim.o.laststatus=3
vim.o.signcolumn = 'yes'

-- Persistent undo
vim.o.undofile = true

-- completion options
vim.o.completeopt = menu,menuone,noselect

-- guifont
vim.cmd [[set guifont=CaskaydiaCove\ Nerd\ Font]]
