-- Snacks: dashboard (replaces alpha-nvim), indent guides (replaces
-- indent-blankline.nvim) and the picker used by opencode.nvim.
-- Only the modules configured below are activated.
return {
	{
		'folke/snacks.nvim',
		lazy = false,
		keys = {
			{ '<C-b>', function()
				local Snacks = require('snacks')
				local explorer = Snacks.picker.get({ source = 'explorer' })[1]
				if explorer then
					explorer:close()
				else
					Snacks.explorer()
				end
			end, desc = 'Snacks: toggle explorer' },
			{ '<Leader>.', function() require('snacks').scratch.open() end, desc = 'Snacks: open scratch' },
			{ '<Leader>S', function() require('snacks').scratch.select() end, desc = 'Snacks: select scratch' },
			{ '<Leader>gB', function() require('snacks').gitbrowse() end, desc = 'Snacks: open in browser' },
			{ '<C-w>', function() require('snacks').bufdelete() end, desc = 'Snacks: delete buffer' },
			{ '<C-p>f', function() Snacks.picker.files() end, desc = 'Snacks: find files' },
			{ '<C-p>b', function() Snacks.picker.buffers() end, desc = 'Snacks: open buffers' },
			{ '<C-p>g', function() Snacks.picker.git_files() end, desc = 'Snacks: git files' },
			{ '<C-p>l', function() Snacks.picker.lines() end, desc = 'Snacks: lines' },
			{ '<C-p>h', function() Snacks.picker.recent() end, desc = 'Snacks: recent files' },
			{ '<C-p>c', function() Snacks.picker.commands() end, desc = 'Snacks: commands' },
			{ '<C-p>m', function() Snacks.picker.marks() end, desc = 'Snacks: marks' },
			{ '<C-p>w', function()
				require('lazy').load({ plugins = { 'workspaces.nvim' } })
				require('workspaces').pick_workspaces()
			end, desc = 'Snacks: workspaces' },
		},
		opts = {
			picker = {
				enabled = true,
				-- Keep global vim.ui.select native; opencode drives the
				-- snacks picker directly through its own config
				ui_select = false,
				sources = {
					-- Show dotfiles, like nvim-tree's filters.dotfiles
					explorer = { hidden = true },
				},
			},
			-- Replaces indent-blankline (which ran with stock config);
			-- animation off for a static look
			indent = {
				enabled = true,
				animate = { enabled = false },
			},
			-- File explorer (replaces nvim-tree); replace_netrw defaults on
			explorer = {
				enabled = true,
			},
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			gitbrowse = { enabled = true },
			bufdelete = { enabled = true },
			scratch = { enabled = true },
			input = { enabled = true },
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
						{ icon = '󰙰 ', key = 'l', desc = '> Load workspace', action = ':lua require("workspaces").pick_workspaces()' },
						{ icon = ' ', key = 'i', desc = '> New file', action = ':ene | startinsert' },
						{ icon = '󰈞 ', key = 'f', desc = '> Find file', action = function() Snacks.picker.files() end },
						{ icon = ' ', key = 'r', desc = '> Recent', action = function() Snacks.picker.recent() end },
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
		},
		config = function(_, opts)
			require('snacks').setup(opts)

			-- Follow directory changes like nvim-tree's update_cwd
			vim.api.nvim_create_autocmd('DirChanged', {
				group = vim.api.nvim_create_augroup('SnacksExplorerFollowCwd', { clear = true }),
				pattern = 'global',
				desc = 'Point the open explorer at the new cwd',
				callback = function(event)
					local explorer = Snacks.picker.get({ source = 'explorer' })[1]
					if explorer and event.file and event.file ~= '' then
						explorer:set_cwd(event.file)
					end
				end,
			})
		end,
	},
}
