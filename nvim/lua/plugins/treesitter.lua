-- Treesitter (main branch rewrite): parsers and queries install into
-- stdpath('data')/site via the tree-sitter CLI; highlighting/folding are
-- core-neovim features and indentation is enabled per filetype below
return {
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'main',
		build = ':TSUpdate',
		lazy = false,
		config = function()
			require('nvim-treesitter').setup({})

			-- One-time parser install (async; a no-op when already installed)
			local fts = require('ft-groups').treesitter_fts
			require('nvim-treesitter').install(fts)

			-- The rewrite ships no highlight/indent activation: enable core
			-- treesitter highlighting and the plugin's indentexpr per
			-- filetype (markdown_inline is a parser name, not a filetype)
			local ft_pattern = vim.tbl_filter(function(ft)
				return ft ~= 'markdown_inline'
			end, fts)
			vim.api.nvim_create_autocmd('FileType', {
				group = vim.api.nvim_create_augroup('TreesitterStartup', { clear = true }),
				pattern = ft_pattern,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	}
}
