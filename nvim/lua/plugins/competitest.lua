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
					args = { '-Wall', '$(FNAME)', '-o', 'a.out' }
				}
			},
			run_command = {
				cpp = { exec = './a.out' },
				py = { exec = 'python "$(FNAME)"' }
			},
			runner_ui = {
				interface = 'split'
			},
			template_file = {
				cpp = '~/d/Competitions/Competitive-Programming/Templates/Template.cpp',
				py = '~/d/Competitions/Competitive-Programming/Templates/Template.py',
				java = '~/d/Competitions/Competitive-Programming/Templates/Template.java'
			}
		}
	}
}
