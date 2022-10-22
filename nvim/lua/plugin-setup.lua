-- No config plugins
local no_config = {
	[1] = 'nvim-autopairs',
	[2] = 'luasnip',
	[3] = 'indent_blankline',
	[4] = 'project_nvim',
	[5] = 'project_nvim',
	[6] = 'gitsigns',
	[7] = 'telescope'
}
for _, plugin in pairs(no_config) do
	require(plugin).setup {}
end

-- nvim-lspconfig
local lsp = require('lspconfig')
local lsp_configs = require('lspconfig.configs')
local lsp_util = require('lspconfig.util')

-- disable virtual text
local on_attach = function(_, bufnr)
	vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
	}
	)
end

if vim.fn.has('termux') == 0 then
	-- Set autocompletion
	local servers = {
		[1] = 'pylsp',
		[2] = 'clangd',
		[3] = 'ltex'
	}
	for _, lsp_server in ipairs(servers) do
		lsp[lsp_server].setup {
			on_attach = on_attach,
		}
	end
end

-- nvimtree
require('nvim-tree').setup {
	hijack_netrw = false,
	disable_netrw = true,
	open_on_setup = false,
	open_on_tab = true,
	update_cwd = true,
	filters = {
		dotfiles = true
	}
}

-- coq-nvim
vim.g.coq_settings = {
	auto_start = 'shut-up',
	clients = {
		snippets = {
			enabled = false
		}
	},
	keymap = {
		jump_to_mark = 'null'
	}
}

-- onedark
require('onedark').setup {
	style = 'cool'
}
require('onedark').load()

-- Lualine configuration
require('lualine').setup {
	options = {
		theme = 'onedark',
		component_separators = '|',
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = {
			{
				'mode',
				separator = { left = '' },
				right_padding = 2
			},
		},
		lualine_b = { 'filetype', 'diagnostics' },
		lualine_c = {
			{
				'filename',
				file_status = true,
				newfile_status = true,
				path = 1
			}
		},
		lualine_x = {},
		lualine_y = { 'diff' },
		lualine_z = {
			{
				'branch',
				separator = { right = '' },
				left_padding = 2
			},
		},
	},
	winbar = {
		lualine_a = {
			{
				'buffers',
				separator = { left = '', right = '' },
				symbols = { alternate_file = '' }
			},
		},
		lualine_z = {
			{
				'tabs',
				separator = { left = '', right = '' },
			}
		}
	},
	inactive_winbar = {
		lualine_a = {
			{
				'buffers',
				symbols = { alternate_file = '' }
			},
		},
		lualine_z = {
			{
				'tabs',
			}
		}
	}
}

-- firenvim
vim.g.firenvim_config = {
	localSettings = {
		['.*'] = {
			takeover = 'never',
			content = 'markdown'
		},
	}
}

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'python',
		'cpp'
	},
	highlight = {
		enable = true
	}
}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

-- nvim-cmp
local cmp = require('cmp')
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<CR>'] = cmp.mapping.confirm({select = true})
	})
}

-- nvim-dap
local dap = require('dap')
dap.configurations.python = {
	{
		type = 'python';
		request = 'launch';
		name = 'Launch file';
		program = '${file}';
		pythonPath = function()
			return '/usr/bin/python'
		end;
	},
}

-- toggleterm.nvim
require('toggleterm').setup {
	winbar = {
		enabled = false
	}
}

-- nvim-notify
vim.notify = require('notify')

-- alpha.nvim
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Set header
dashboard.section.header.val = {
    '                                                     ',
    '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
    '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
    '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
    '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
    '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
    '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
    '                                                     ',
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( 'e', '  > New file' , ':ene <BAR> startinsert <CR>'),
    dashboard.button( 'f', '  > Find file', ':Files<CR>'),
    dashboard.button( 'r', '  > Recent'   , ':Telescope oldfiles<CR>'),
    dashboard.button( 's', '  > Settings' , ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'),
    dashboard.button( 'q', '  > Quit NVIM', ':qa<CR>'),
}

-- Send config to alpha
alpha.setup(dashboard.opts)
