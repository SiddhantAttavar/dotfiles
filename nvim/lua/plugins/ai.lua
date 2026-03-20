return {
	-- Opencode
	{
		'nickjvandyke/opencode.nvim',
		cmd = { 'OpenCode', 'OpenCodeToggle' },
		keys = {
			{ '<Leader>oc', '<ESC>:lua require("opencode").toggle()<CR>' },
			{ '<Leader>os', '<ESC>:lua require("opencode").stop()<CR>', }
		},
		config = function()
			-- Configure to reuse the same server across sessions
			vim.g.opencode_opts = {
				server = {
					start = function()
						require('opencode.terminal').start('opencode --port')
					end,
					stop = function()
						require('opencode.terminal').stop()
					end,
					toggle = function()
						require('opencode.terminal').toggle('opencode --port')
					end,
				},
				events = {
					enabled = true,
					reload = true,
				},
			}

			-- Make OpenCode buffer unlisted so it doesn't show in lualine
			vim.api.nvim_create_autocmd('TermOpen', {
				pattern = 'term://*opencode*',
				callback = function(event)
					vim.api.nvim_buf_set_option(event.buf, 'buflisted', false)
				end,
			})

			-- Auto-select last session when server connects
			vim.api.nvim_create_autocmd('User', {
				pattern = 'OpencodeEvent:server.connected',
				callback = function()
					require('opencode').command('session.last')
				end,
			})

			-- Stop OpenCode when exiting vim
			vim.api.nvim_create_autocmd('VimLeavePre', {
				callback = require('opencode').stop
			})
		end,
	},

	-- Github copilot
	{
		'zbirenbaum/copilot.lua',
		dependencies = { 'copilotlsp-nvim/copilot-lsp' },
		keys = {
			{ '<Leader>oe', '<ESC>:Copilot enable<CR>' },
			{ '<Leader>ot', '<ESC>:Copilot suggestions toggle_auto_trigger<CR>' }
		},
		cmd = { 'Copilot' },
		config = true,
		opts = {
			suggestions = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = '<Tab>',
					prev = '<Leader>sp',
					next = '<Leader>sn',
					dismiss = '<Leader>sd'
				}
			},
			nes = {
				enabled = true,
				keymap = {
					accept_and_goto = '<Leader>sa',
					dismiss = '<ESC>'
				}
			}
		}
	}
}
