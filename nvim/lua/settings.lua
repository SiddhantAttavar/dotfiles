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

-- Folding
vim.o.foldlevelstart = 99

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
vim.opt.termguicolors = true

-- Text encoding settings
vim.o.encoding = 'UTF-8'
vim.o.fileformat = 'unix'

-- Buffer management
vim.o.splitright = true
vim.o.hidden = true
vim.api.nvim_create_autocmd({ 'VimEnter' }, { command = 'set laststatus=3' })
vim.o.signcolumn = 'yes'

-- Persistent undo
vim.o.undofile = true

-- Completion options
vim.o.completeopt = 'menu'

-- guifont
vim.cmd [[set guifont=CaskaydiaCove\ Nerd\ Font]]

-- Timeout
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Conceal settings
vim.o.conceallevel = 2
vim.g.vim_markdown_conceal = 1

-- Markdown
vim.g.markdown_fenced_languages = {
	'python',
	'cpp'
}

-- Dictionary
vim.opt_global.dictionary = vim.fn.stdpath('config') .. '/spell/en.dict'

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Autoread
vim.g.autoread = true

vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cindent = true

-- Custom filetypes
vim.filetype.add({
	pattern = {
		[".*%.config"] = "config"
	}
})
