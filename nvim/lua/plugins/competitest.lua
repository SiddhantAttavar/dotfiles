return {
	-- Competitive Programming
	{
		'xeluxee/competitest.nvim',
		dependencies = { 'MunifTanjim/nui.nvim' },
		cmd = { 'CompetiTestAdd', 'CompetiTestRun', 'CompetiTestReceive' },
		keys = {
			{ '<Leader>ur', ':CompetiTestRun<CR>' },
			{ '<Leader>uc', ':CompetiTestReceive contest<CR>' },
			{ '<Leader>ut', ':CompetiTestReceive testcases<CR>' },
			{ '<Leader>up', ':CompetiTestReceive problem<CR>' }
		},
		config = function()
			require('competitest').setup {
				testcases_use_single_file = true,
				compile_command = {
					cpp = {
						exec = 'g++',
						args = { '-Wall', '$(FNAME)', '-o', 'a.out' }
					}
				},
				run_command = {
					cpp = { exec = './a.out' }
				},
				runner_ui = {
					interface = 'split'
				}
			}
		end
	}
}
