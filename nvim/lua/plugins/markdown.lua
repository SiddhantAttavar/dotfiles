-- Markdown plugins
local text_fts = require('ft-groups').text_fts
local file_exists = require('utils').file_exists
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
		keys = { { '<Leader>m', ':MarkdownPreviewToggle<CR>' } },
		init = function()
			vim.g.mkdp_auto_close = 0
		end
	},

	-- Vim markdown
	{
		'preservim/vim-markdown',
		dependencies = { 'godlygeek/tabular' },
		ft = text_fts,
		init = function ()
			vim.g.vim_markdown_math = 1
		end
	},

	-- M.text_ftskdnflow
	{
		'jakewvincent/mkdnflow.nvim',
		ft = text_fts,
		config = true,
		opts = {
			path_resolution = {
				primary = 'current',
				fallback = 'first'
			}
		}
	},

	-- Images
    {
        '3rd/image.nvim',
        ft = { 'markdown' },
        opts = {
            backend = 'ueberzug',
            max_width = 100, -- tweak to preference
            max_height = 12, -- ^
            max_height_window_percentage = math.huge, -- this is necessary for a good experience
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
			integrations = {
				markdown = {
					resolve_image_path = function (document_path, image_path, fallback)
						return fallback(document_path, image_path)
					end
				}
			}
        }
    }
}
