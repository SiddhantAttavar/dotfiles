-- Neovim specific plugins
if vim.loop.os_uname().sysname == 'Windows' then
	vim.call('plug#begin', '~/AppData/Local/nvim/plugged')
else
	vim.call('plug#begin', '~/.config/nvim/plugged')
end

local Plug = vim.fn['plug#']

-- Plug 'foo/bar'
-- Onedark theme
Plug 'navarasu/onedark.nvim'

-- Fuzzy file search
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'

-- Git
Plug 'tpope/vim-fugitive'

-- Terminal
Plug 's1n7ax/nvim-terminal'

-- Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

-- Startup page, tabs, status bar, terminal and explorer
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'

-- Browser nvim extension
Plug('glacambre/firenvim', {['do'] = vim.fn['firenvim#install(0)']})

-- LSP and autocomplete
Plug 'neovim/nvim-lspconfig'
if vim.loop.os_uname().sysname ~= 'Windows' then
	Plug('ms-jpq/coq_nvim', {['run'] = 'python3 -m coq deps'})
	Plug 'ms-jpq/coq.artifacts'
	Plug 'ms-jpq/coq.thirdparty'
end

-- Competitive programming
--Plug 'searleser97/cpbooster.vim'

vim.call('plug#end')
