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
			links = {
				transform_implicit = function(input)
					local pwd_file = vim.fn.getcwd() .. '/' .. input
					local sub_folder_file = vim.fn.expand('%:p:h') .. '/' .. input

					-- Try to check the subfolder first
					if file_exists(sub_folder_file) then
						return sub_folder_file
					end

					-- Check the pwd next
					if file_exists(pwd_file) then
						return pwd_file
					end

					-- Create a file in the subfolder
					return sub_folder_file
				end,
				transform_explicit = function(input)
					if input == '' then
						return os.date('%d-%m-%y')
					end
					return input:gsub('[ /]', '-'):lower()
				end
			},
			to_do = {
				symbols = {
					' ',
					'x',
					'-'
				}
			}
		}
	}
}
