return {
	-- Session manager
	{
		'natecraddock/sessions.nvim',
		cmd = { 'SessionsSave', 'SessionsLoad', 'SessionsStop' },
		config = true,
		opts = {
			session_filepath = vim.fn.stdpath("data") .. "/sessions",
			absolute = true
		}
	},

	-- Workspace manager
	{
		'natecraddock/workspaces.nvim',
		cmd = { 'WorkspacesAdd', 'WorkspacesAddDir', 'WorkspacesRemove', 'WorkspacesRemoveDir', 'WorkspacesRename', 'WorkspacesList', 'WorkspacesListDirs', 'WorkspacesOpen', 'WorkspacesSyncDirs' },
		keys = {
			{ '<Leader>qa', ':WorkspacesAdd<CR>' },
			{ '<Leader>qr', ':WorkspacesRemove<CR>' },
			{ '<Leader>qo', '<cmd>lua require("workspaces").pick_workspaces()<CR>', desc = 'Pick workspace' },
		},
		lazy = 'false',
		config = function()
			local workspaces = require('workspaces')
			workspaces.setup {
				auto_open = false,
				hooks = {
					add = { 'SessionsSave' },
					open = { 'SessionsLoad' },
					remove = { 'SessionsStop' }
				}
			}

		workspaces.pick_workspaces = function()
			local items = {}
			for idx, workspace in ipairs(workspaces.get()) do
				table.insert(items, { text = workspace.name, idx = idx })
			end

			return Snacks.picker.pick({
				title = ' Workspaces ',
				layout = 'select',
				items = items,
				format = function(item)
					return { { item.text } }
				end,
				actions = {
					confirm = function(picker, item)
						picker:close()
						if item then
							vim.cmd('WorkspacesOpen ' .. vim.fn.fnameescape(item.text))
						end
					end,
				},
			})
		end
		end
	}
}
