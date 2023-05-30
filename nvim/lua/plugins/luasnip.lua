return {
	-- LuaSnip
	{
		'L3MON4D3/LuaSnip',
		lazy = false,
		build = 'make install_jsregexp',
		dependencies = { 'honza/vim-snippets' },
		config = function()
			require('luasnip').setup()
			require('luasnip.loaders.from_snipmate').lazy_load({ paths = '~/.local/share/nvim/lazy/vim-snippets/snippets' })
		end
	}
}
