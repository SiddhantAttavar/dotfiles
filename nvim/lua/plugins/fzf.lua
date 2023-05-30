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
		},
		config = function()
			vim.cmd [[command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'pistol {}']}, <bang>0)]]
		end
	}
}
