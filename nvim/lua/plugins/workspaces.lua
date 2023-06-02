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
		dependencies = { 'junegunn/fzf.vim' },
		cmd = { 'WorkspacesAdd', 'WorkspacesAddDir', 'WorkspacesRemove', 'WorkspacesRemoveDir', 'WorkspacesRename', 'WorkspacesList', 'WorkspacesListDirs', 'WorkspacesOpen', 'WorkspacesSyncDirs' },
		keys = {
			{ '<Leader>qa', ':WorkspacesAdd<CR>' },
			{ '<Leader>qr', ':WorkspacesRemove<CR>' },
			{ '<Leader>qo', ':lua require("workspaces").fzf_open_workspaces()<CR>' },
		},
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

			workspaces.fzf_open_workspaces = function()
				local workspaces_list = {}
				for _, workspace in ipairs(workspaces.get()) do
					table.insert(workspaces_list, workspace.name)
				end

				vim.api.nvim_call_function('fzf#run', { vim.api.nvim_call_function('fzf#wrap', { {
					source = workspaces_list,
					sink = 'WorkspacesOpen',
					options = '--prompt "Workspaces>" --preview-window=hidden'
				} }) })
			end
		end
	}
}
