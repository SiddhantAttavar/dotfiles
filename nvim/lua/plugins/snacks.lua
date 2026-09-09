-- Snacks: dashboard (replaces alpha-nvim), indent guides (replaces
-- indent-blankline.nvim) and the picker used by opencode.nvim.
-- Only the modules configured below are activated.
return {
	{
		'folke/snacks.nvim',
		lazy = false,
		opts = {
			picker = {
				enabled = true,
				-- Keep global vim.ui.select native; opencode drives the
				-- snacks picker directly through its own config
				ui_select = false,
			},
			-- Replaces indent-blankline (which ran with stock config);
			-- animation off for a static look
			indent = {
				enabled = true,
				animate = { enabled = false },
			},
			-- Replaces alpha-nvim: same header art and buttons
			dashboard = {
				enabled = true,
				preset = {
					header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
					keys = {
						{ icon = '󰙰 ', key = 'l', desc = '> Load workspace', action = ':lua require("workspaces").fzf_open_workspaces()' },
						{ icon = ' ', key = 'i', desc = '> New file', action = ':ene | startinsert' },
						{ icon = '󰈞 ', key = 'f', desc = '> Find file', action = ':Files' },
						{ icon = ' ', key = 'r', desc = '> Recent', action = ':History' },
						{ icon = '󰎞 ', key = 'w', desc = '> Open wiki', action = ':WorkspacesOpen wiki' },
						{ icon = ' ', key = 's', desc = '> Settings', action = ':e $MYVIMRC' },
						{ icon = ' ', key = 'c', desc = '> Competitive Programming', action = ':WorkspacesOpen Competitive-Programming' },
						{ icon = '󰿅 ', key = 'q', desc = '> Quit NVIM', action = ':qa' },
					},
				},
				sections = {
					{ section = 'header' },
					{ section = 'keys', gap = 1, padding = 1 },
					{
						title = 'Workspaces',
						function()
							local ok = pcall(function()
								require('lazy').load({ plugins = { 'workspaces.nvim' } })
							end)
							if not ok then
								return { { desc = 'workspaces.nvim unavailable' } }
							end
							local items = {}
							for _, ws in ipairs(require('workspaces').get()) do
								if #items >= 5 then
									break
								end
								items[#items + 1] = {
									icon = '󰙰 ',
									desc = ws.name,
									action = ':WorkspacesOpen ' .. ws.name,
									autokey = true,
								}
							end
							if #items == 0 then
								items[1] = { desc = 'no workspaces yet (use <Leader>qa to add one)' }
							end
							return items
						end,
						padding = 1
					},
					{
						title = 'Recent Files',
						section = 'recent_files',
						cwd = false,
						limit = 5,
						padding = 1
					}
				}
			}
		}
	}
}
