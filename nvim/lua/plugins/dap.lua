return {
	-- Debugging
	{
		'mfussenegger/nvim-dap',
		ft = require('ft-groups').dap_fts,
		config = function()
			require('dap').configurations.python = {
				{
					type = 'python',
					request = 'launch',
					name = 'Launch file',
					program = '${file}',
					pythonPath = function()
						return '/usr/bin/python'
					end,
				},
			}
		end
	}
}
