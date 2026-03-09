return {
	"nwiizo/marp.nvim",
	ft = "markdown",
	config = function()
		require("marp").setup {
			-- Optional configuration
			marp_command = "/home/sidat/.nvm/versions/node/v22.5.1/bin/marp",
			browser = "firefox", -- auto-detect
			server_mode = false, -- Use watch mode (-w)
		}
	end,
}
