-- nvim-lspconfig
local lsp = require('lspconfig')
local lsp_configs = require('lspconfig.configs')
local lsp_util = require('lspconfig.util')
lsp.pylsp.setup {}
lsp.clangd.setup {}
lsp.ltex.setup{}

-- Set autocompletion
local servers = {}
for _, lsp_server in ipairs(servers) do
	lsp[lsp_server].setup {
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
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
require('lualine').setup {
	options = {
		theme = 'onedark'
	},
	winbar = {
		lualine_c = {
			{
				'buffers',
				show_filename_only = {'true'}
			},
		}
	},
	inactive_winbar = {
		lualine_c = {'buffers'}
	}
}

-- nvim-terminal
require('nvim-terminal').setup {
	toggle_keymap = '<C-f>'
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

-- nvim-autopairs
require('nvim-autopairs').setup {}

-- luasnip
local luasnip = require('luasnip')
luasnip.setup {}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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
