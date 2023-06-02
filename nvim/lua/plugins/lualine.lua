return {
	-- Lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'lewis6991/gitsigns.nvim' },
		keys = {
			{ '<Leader>e', vim.diagnostic.open_float },
			{ '[d',        vim.diagnostic.goto_prev },
			{ ']d',        vim.diagnostic.goto_next },
			{ '<Leader>q', vim.diagnostic.setloclist }
		},
		lazy = false,
		config = true,
		opts = {
			options = {
				theme = 'onedark',
				component_separators = '|',
				section_separators = { left = '', right = '' },
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{
						'mode',
						separator = { left = '' },
						right_padding = 2
					},
				},
				lualine_b = { 'filetype' },
				lualine_c = {
					{
						'filename',
						file_status = true,
						newfile_status = true,
						path = 1
					}
				},
				lualine_y = {
					{
						'diff',
						source = 'fugitive_source'
					}
				},
				lualine_z = {
					{
						'g:gitsigns_head',
						icon = '',
						separator = { right = '' },
						left_padding = 2
					}
				},
			},
			tabline = {
				lualine_a = {
					{
						'buffers',
						separator = { left = '', right = '' },
						symbols = { alternate_file = '' }
					},
				},
				lualine_c = {
					{
						'diagnostics',
						sources = { 'nvim_diagnostic' }
					}
				},
				lualine_z = {
					{
						'tabs',
						separator = { left = '', right = '' },
					}
				}
			},
			extensions = {
				'fzf',
				'nvim-tree',
				'toggleterm'
			}
		}
	}
}
