return {
	-- Competitive Programming
	{
		'xeluxee/competitest.nvim',
		dependencies = { 'MunifTanjim/nui.nvim' },
		cmd = { 'CompetiTest' },
		keys = {
			{ '<Leader>ur', ':CompetiTest run<CR>' },
			{ '<Leader>uc', ':CompetiTest receive contest<CR>' },
			{ '<Leader>ut', ':CompetiTest receive testcases<CR>' },
			{ '<Leader>up', ':CompetiTest receive problem<CR>' }
		},
		config = true,
		opts = {
			testcases_use_single_file = true,
			compile_command = {
				cpp = {
					exec = 'g++',
					args = { '-Wall', '-fsanitize=undefined', '$(FNAME)', '-o', 'a.out' }
				}
				-- py = { exec = 'python3', args = { '$(FNAME)' } }
			},
			run_command = {
				cpp = { exec = './a.out' },
				python = { exec = 'python3', args = { '$(FNAME)' } }
			},
			runner_ui = {
				interface = 'split'
			},
			template_file = {
				cpp = '~/competitions/Competitive-Programming/Templates/Template.cpp',
				py = '~/competitions/Competitive-Programming/Templates/Template.py',
				java = '~/competitions/Competitive-Programming/Templates/Template.java'
			},
			view_output_diff = true
		}
	}
}
