-- No config plugins
local no_config = {
	[1] = 'nvim-autopairs',
	[2] = 'indent_blankline',
	[3] = 'gitsigns',
	[4] = 'Comment',
	[5] = 'guess-indent',
	[6] = 'mason',
	[7] = 'null-ls',
	[8] = 'luasnip'
}
for _, plugin in pairs(no_config) do
	require(plugin).setup {}
end

-- nvim-lspconfig
local lsp = require('lspconfig')
local navic = require('nvim-navic')

-- Set up lsps
local on_attach = function(client, bufnr)
	vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		update_in_insert = false,
	}
	)

	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Set autocompletion
local servers = {
	[1] = 'pylsp',
	[2] = 'clangd',
	[3] = 'prosemd_lsp'
}
for _, lsp_server in ipairs(servers) do
	lsp[lsp_server].setup {
		on_attach = on_attach,
	}
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
function get_buffers()
	local curr_win = nvim.api.nvim_ta
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed
		}
	else
		return {0, 0, 0}
	end
end

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
		lualine_y = {
			{
				'diff',
				source = 'gitsign_source'
			}
		},
		lualine_z = {
			{
				'FugitiveHead',
				icon = '',
				separator = { right = '' },
				left_padding = 2
			}
		},
	},
	tabline = {
		lualine_a = {
			{
				'buffers',
				separator = { left = '', right = '' },
				symbols = { alternate_file = '' }
			},
		},
		lualine_c = {
			{
				navic.get_location,
				cond = navic.is_available
			}
		},
		lualine_z = {
			{
				'tabs',
				separator = { left = '', right = '' },
			}
		}
	},
	extensions = {
		'fugitive',
		'fzf',
		'nvim-tree',
		'toggleterm'
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
local luasnip = require('luasnip')

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
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
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
	dashboard.button( 'e', '	> New file' , ':ene <BAR> startinsert <CR>'),
	dashboard.button( 'f', '	> Find file', ':Files<CR>'),
	dashboard.button( 'r', '	> Recent'	 , ':History<CR>'),
	dashboard.button( 's', '	> Settings' , ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'),
	dashboard.button( 'q', '	> Quit NVIM', ':qa<CR>'),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- fzf.vim
vim.cmd [[command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'pistol {}']}, <bang>0)]]

-- competitest.nvim
require('competitest').setup {
	testcases_directory = '~/d/Competitions/Competitive-Programming/build',
	testcases_use_single_file = true
}

-- markdown-preview.nvim
vim.g.mkdp_markdown_css = '~/test.css'

-- nvim-navic
navic.setup {
	highlight = true,
	depth_limit = 3
}

-- leap.nvim
require('leap').add_default_mappings()
