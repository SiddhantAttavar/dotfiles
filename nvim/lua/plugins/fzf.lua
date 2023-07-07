return {
	-- Fuzzy finder / Telescope
	{
		'junegunn/fzf.vim',
		dependencies = { 'junegunn/fzf' },
		build = ':call fzf#install()',
		cmd = { 'Files', 'History', 'Buffers', 'GFiles', 'Lines', 'Commands', 'Marks' },
		keys = {
			{ '<C-p>f', ':Files<CR>' },
			{ '<C-p>b', ':Buffers<CR>' },
			{ '<C-p>g', ':GFiles<CR>' },
			{ '<C-p>l', ':Lines<CR>' },
			{ '<C-p>h', ':History<CR>' },
			{ '<C-p>c', ':Commands<CR>' },
			{ '<C-p>m', ':Marks<CR>' },
			{ '<C-p>w', ':lua require("workspaces").fzf_open_workspaces()<CR>' }
		}
	}
}
