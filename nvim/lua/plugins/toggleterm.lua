return {
	-- Terminal
	{
		'akinsho/toggleterm.nvim',
		cmd = { 'ToggleTerm', 'ToggleTermToggleAll', 'TermExec', 'TermSelect', 'ToggleTermSetName', },
		keys = {
			{ '<C-f>',     ':ToggleTerm<CR>' },
			{ '<C-g>',     ':ToggleTerm direction=vertical<CR>' },
			{ '<C-f>',     '<C-\\><C-n>:ToggleTerm<CR>',         mode = 't' },
			{ '<C-g>',     '<C-\\><C-n>:ToggleTerm<CR>',         mode = 't' },
			{ '<esc>',     '<C-\\><C-n>',                        mode = 't' },
			{ '<Leader>h', '<Cmd>wincmd h<CR>',                  mode = 't' },
			{ '<Leader>j', '<Cmd>wincmd j<CR>',                  mode = 't' },
			{ '<Leader>k', '<Cmd>wincmd k<CR>',                  mode = 't' },
			{ '<Leader>l', '<Cmd>wincmd l<CR>',                  mode = 't' },
			{ '<C-q>',     ':wa<CR>:TermExec cmd="exit 123"<CR>' },
		},
		config = function()
			require('toggleterm').setup {
				size = function(term)
					if term.direction == "horizontal" then
						return 15
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.3
					end
				end,
				winbar = {
					enabled = false
				},
				on_exit = function(t, job, exit_code, name)
					if exit_code == 123 then
						vim.cmd [[xa]]
					end
				end
			}
		end
	}
}
