return {
	-- Debugging
	{
		'mfussenegger/nvim-dap',
		ft = dap_fts,
		config = function()
			local dap = require('dap')
			dap.configurations.python = {
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
