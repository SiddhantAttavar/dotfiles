return {
	-- Movement
	{
		'ggandor/leap.nvim',
		keys = { { 's', ':lua require("leap").leap { target_windows = { vim.fn.win_getid() } }<CR>' } },
		lazy = false,
		config = function()
			require('leap').add_default_mappings()
		end
	}
}
