-- Markdown plugins
local text_fts = require('plugins.ft-groups').text_fts
return {
	-- Markdowny
	{
		'antonk52/markdowny.nvim',
		ft = text_fts,
		keys = { { '<C-y>', ':lua require("markdowny").link()<CR>', mode = 'v', buffer = 0 } },
		config = function()
			require('markdowny').setup()
		end
	},

	-- Markdown preview
	{
		'iamcco/markdown-preview.nvim',
		build = ':call mkdp#util#install()',
		ft = text_fts,
		keys = { { '<Leader>m', ':MarkdownPreviewToggle<CR>' } }
	},
	
	-- Vim markdown
	{
		'preservim/vim-markdown',
		ft = text_fts,
		config = function()
			vim.g.vim_markdown_conceal = 1
		end
	},

	-- M.text_ftskdnflow
	{
		'jakewvincent/mkdnflow.nvim',
		ft = text_fts,
		config = function()
			require('mkdnflow').setup()
		end
	}
}
