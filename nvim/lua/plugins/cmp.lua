-- General sources
local cmp_sources = {
	{
		{ name = 'path' },
		{ name = 'calc' },
	},
	{
		{ name = 'luasnip' },
		{ name = 'buffer' },
	}
}

-- Filetype groups
local ft_source_groups = {
	{
		fts = require('ft-groups').text_fts,
		config = { name = 'dictionary' },
		index = 2
	},
	{
		fts = require('ft-groups').lsp_fts,
		config = { name = 'nvim_lsp' },
		index = 1
	},
	{
		fts = { 'gitcommit', 'octo' },
		config = { name = 'git' },
		index = 1
	}
}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

-- Kind icons
local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

-- Menu items
local cmp_item_menu = {
	dictionary = "[Dictionary]",
	omni = "[Omnifunc]",
	calc = "[Calculator]",
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	luasnip = "[LuaSnip]",
	latex_symbols = "[LaTeX]",
}

return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'windwp/nvim-autopairs', 'uga-rosa/cmp-dictionary', 'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-cmdline' },
		lazy = false,
		config = function()
			-- nvim-cmp
			local cmp = require('cmp')
			local luasnip = require('luasnip')

			cmp.setup {
				sources = cmp.config.sources(unpack(cmp_sources)),
				performance = {
					max_view_entries = 10
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				mapping = cmp.mapping.preset.insert({
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
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
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = true }),
						c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					}),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
				}),
				view = {
					entries = {
						name = 'custom',
						selection_order = 'near_cursor'
					}
				},
				formatting = {
					format = function(entry, vim_item)
						-- Kind icons
						-- This concatonates the icons with the name of the item kind
						vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
						-- Source
						vim_item.menu = (cmp_item_menu)[entry.source.name]
						return vim_item
					end
				},
			}

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})

			-- Filetype specific sources
			local ft_sources = {}

			for _, ft_source_group in ipairs(ft_source_groups) do
				for _, ft in ipairs(ft_source_group.fts) do
					if ft_sources[ft] == nil then
						ft_sources[ft] = vim.deepcopy(cmp_sources)
					end

					table.insert(ft_sources[ft][ft_source_group.index], ft_source_group.config)
				end
			end

			for ft, custom_sources in pairs(ft_sources) do
				cmp.setup.filetype(ft, {
					sources = cmp.config.sources(unpack(custom_sources))
				})
			end

			-- Autopair
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end
	}
}
