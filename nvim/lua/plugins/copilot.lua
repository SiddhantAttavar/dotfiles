return {
	{
		'zbirenbaum/copilot.lua',
		dependencies = { 'copilotlsp-nvim/copilot-lsp', 'zbirenbaum/copilot-cmp' },
		cmd = 'Copilot',
		config = true,
		opts = {
			panel = { enabled = false },
			suggestion = { enabled = false }
		},
	},

	{
		'zbirenbaum/copilot-cmp',
		dependencies = { 'zbirenbaum/copilot.lua', 'hrsh7th/nvim-cmp' },
		cmd = 'Copilot',
		config = function()
			require("copilot_cmp").setup()
			local cmp = require("cmp")
			for _, source in ipairs(cmp.get_config().sources) do
				if source.name == "copilot" then
					return
				end
			end
		end
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		cmd = { 'CopilotChat', 'CopilotChatToggle' },
		keys = { { '<C-o>', ':CopilotChatToggle<CR>' } },
		dependencies = { { "nvim-lua/plenary.nvim", branch = "master" }, },
		build = "make tiktoken"
	},
}
