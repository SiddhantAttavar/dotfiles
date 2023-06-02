-- Markdown plugins
local text_fts = require('ft-groups').text_fts
return {
	-- Markdowny
	{
		'antonk52/markdowny.nvim',
		ft = text_fts,
		keys = { { '<C-y>', ':lua require("markdowny").link()<CR>', mode = 'v', buffer = 0 } },
		config = true
	},

	-- Markdown preview
	{
		'iamcco/markdown-preview.nvim',
		build = ':call mkdp#util#install()',
		ft = text_fts,
		cmd = { 'MarkdownPreviewToggle' },
		keys = { { '<Leader>m', ':MarkdownPreviewToggle<CR>' } }
	},

	-- Vim markdown
	{
		'preservim/vim-markdown',
		ft = text_fts,
	},

	-- M.text_ftskdnflow
	{
		'jakewvincent/mkdnflow.nvim',
		ft = text_fts,
		config = true
	}
}
