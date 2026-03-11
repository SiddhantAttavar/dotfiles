return {
	{
		"nickjvandyke/opencode.nvim",
		cmd = { "OpenCode", "OpenCodeToggle" },
		keys = {
			{ "<Leader>oc", "<ESC>:lua require('opencode').toggle()<CR>" },
			{ "<Leader>os", "<ESC>:lua require('opencode').stop()<CR>", }
		},
		config = function()
			-- Configure to reuse the same server across sessions
			vim.g.opencode_opts = {
				server = {
					start = function()
						require("opencode.terminal").start("opencode --port")
					end,
					stop = function()
						require("opencode.terminal").stop()
					end,
					toggle = function()
						require("opencode.terminal").toggle("opencode --port")
					end,
				},
				events = {
					enabled = true,
					reload = true,
				},
			}

			-- Make OpenCode buffer unlisted so it doesn't show in lualine
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*opencode*",
				callback = function(event)
					vim.api.nvim_buf_set_option(event.buf, 'buflisted', false)
				end,
			})

			-- Auto-select last session when server connects
			vim.api.nvim_create_autocmd("User", {
				pattern = "OpencodeEvent:server.connected",
				callback = function()
					require("opencode").command("session.last")
				end,
			})

			-- Stop OpenCode when exiting vim
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = require("opencode").stop
			})
		end,
	},
}
