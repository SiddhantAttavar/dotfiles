-- Install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local dap_fts = { 'python' }
local treesitter_fts = { 'python', 'cpp', 'java', 'markdown', 'lua' }
local text_fts = { 'markdown', 'txt' }

-- Lazy plugins
local plugins = {
	-- { 'foo/bar' },

	-- Simple tpope plugins
	{ 'tpope/vim-sensible', lazy = false },
	{ 'tpope/vim-obsession', lazy = false },
	{ 'tpope/vim-surround', lazy = false },
	{ 'tpope/vim-eunuch', lazy = false },
	{ 'tpope/vim-tbone', cmd = { 'Tmux', 'Tyank', 'Tput', 'Twrite', 'Tattach' } },
	{ 'tpope/vim-abolish', ft = text_fts },
	{ 'tpope/vim-endwise', ft = text_fts },

	-- plenary
	{ 'nvim-lua/plenary.nvim', lazy = false },

	-- Onedark theme
	{ 'navarasu/onedark.nvim',
		lazy = false,
		config = function()
			require('onedark').setup {
				style = 'cool'
			}
			require('onedark').load()
		end
	},

	-- Fuzzy finder / Telescope
	{ 'junegunn/fzf.vim',
		dependencies = { 'junegunn/fzf' },
		build = ':call fzf#install()',
		cmd = { 'Files', 'History', 'Gfiles', 'Buffers', 'Lines', 'Commands' },
		keys = { { '<C-p>', ':Files<CR>' } },
		config = function()
			vim.cmd [[command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'pistol {}']}, <bang>0)]]
		end
	},

	-- Git
	{ 'tpope/vim-fugitive', cmd = { 'Git', 'G' } },

	-- Icons
	{ 'kyazdani42/nvim-web-devicons', lazy = false },

	-- Dashboard
	{ 'goolord/alpha-nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		cond = function()
			return vim.fn.argc() == 0
		end,
		lazy = false,
		config = function()
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
				'  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝	  ╚═╝ ',
				'                                                     ',
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button( 'e', '	> New file' , ':ene <BAR> startinsert <CR>'),
				dashboard.button( 'f', '	> Find file', ':Files<CR>'),
				dashboard.button( 'r', '	> Recent'	 , ':History<CR>'),
				dashboard.button( 's', '	> Settings' , ':e $MYVIMRC<CR>'),
				dashboard.button( 'q', '	> Quit NVIM', ':qa<CR>'),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)
		end
	},

	-- File Tree
	{ 'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeToggle',
		keys = { { '<C-b>', ':NvimTreeToggle<CR>' } },
		config = function()
			require('nvim-tree').setup {
				hijack_netrw = true,
				disable_netrw = true,
				open_on_tab = true,
				update_cwd = true,
				filters = {
					dotfiles = true
				}
			}
		end
	},

	-- Terminal
	{ 'akinsho/toggleterm.nvim',
		cmd = { 'ToggleTerm', 'ToggleTermToggleAll', 'TermExec', 'TermSelect', 'ToggleTermSetName', },
		keys = {
			{ '<C-f>', ':ToggleTerm<CR>' },
			{ '<C-g>', ':ToggleTerm direction=vertical<CR>' },
			{ '<C-f>', '<C-\\><C-n>:ToggleTerm<CR>', mode = 't' },
			{ '<C-g>', '<C-\\><C-n>:ToggleTerm<CR>', mode = 't' },
			{ '<esc>', '<C-\\><C-n>', mode = 't' },
			{ '<Leader>h', '<Cmd>wincmd h<CR>', mode = 't' },
			{ '<Leader>j', '<Cmd>wincmd j<CR>', mode = 't' },
			{ '<Leader>k', '<Cmd>wincmd k<CR>', mode = 't' },
			{ '<Leader>l', '<Cmd>wincmd l<CR>', mode = 't' },
			{ '<C-q>', ':wa<CR>:TermExec cmd="exit 123"<CR>' },
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
	},

	-- Notifications
	{ 'rcarriga/nvim-notify',
		lazy = false,
		config = function()
			vim.notify = require('notify')
		end
	},

	-- Lualine
	{ 'nvim-lualine/lualine.nvim',
		dependencies = { 'lewis6991/gitsigns.nvim' },
		keys = {
			{ '<Leader>e', vim.diagnostic.open_float },
			{ '[d', vim.diagnostic.goto_prev },
			{ ']d', vim.diagnostic.goto_next },
			{ '<Leader>q', vim.diagnostic.setloclist }
		},
		lazy = false,
		config = function()
			require('lualine').setup {
				options = {
					theme = 'onedark',
					component_separators = '|',
					section_separators = { left = '', right = '' },
					globalstatus = true,
				},
				sections = {
					lualine_a = {
						{
							'mode',
							separator = { left = '' },
							right_padding = 2
						},
					},
					lualine_b = { 'filetype' },
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
							source = 'fugitive_source'
						}
					},
					lualine_z = {
						{
							'g:gitsigns_head',
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
							'diagnostics',
							sources = { 'nvim_diagnostic' }
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
					'fzf',
					'nvim-tree',
					'toggleterm'
				}
			}
		end
	},

	-- Mason
	{ 'williamboman/mason.nvim',
		dependencies = { 'williamboman/mason-lspconfig.nvim' },
		build = ':MasonUpdate',
		cmd = { 'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
		config = function()
			require('mason').setup {}

			-- setup LSPs
			require('mason-lspconfig').setup {
				ensure_installed = {
					'pylsp',
					'clangd',
					'prosemd_lsp',
					'lua_ls'
				}
			}
		end
	},

	{ 'neovim/nvim-lspconfig',
		dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'hrsh7th/cmp-nvim-lsp', 'ray-x/lsp_signature.nvim' },
		lazy = false,
		config = function()
			local lspconfig = require('lspconfig')

			-- Diagnostic display options
			local signs = { Error = '✘', Warn = '▲', Hint = '⚑', Info = '»' }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			local server_config = {
				pylsp = {
					settings = {
						pylsp = {
							plugins = {
								pycodestyle = {
									enabled = false
								}
							}
						}
					}
				},
				clangd = {},
				prosemd_lsp = {},
				lua_ls = {
					settings = {
						Lua = {
							runtime = {
								version = 'LuaJIT',
							},
							diagnostics = {
								globals = { 'vim' }
							},
							telemetry = {
								enable = false
							}
						}
					}
				}
			}

			-- Customize defaults
			local lsp_default_config = lspconfig.util.default_config
			lsp_default_config.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_default_config.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			lsp_default_config.on_attach = function(client, bufnr)
				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap=true, silent=true, buffer=bufnr }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
				vim.keymap.set('n', '<C-S-k>', vim.lsp.buf.hover, bufopts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
				vim.keymap.set('n', '<Leader>wk', vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set('n', '<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
				vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
				vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
				vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
			end

			-- Setup lsp servers
			for server_name, config in pairs(server_config) do
				lspconfig[server_name].setup(config)
			end

			-- lsp_signature setup
			require('lsp_signature').setup {}
		end
	},

	-- Debugging
	{ 'mfussenegger/nvim-dap',
		ft = dap_fts,
		config = function()
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
		end
	},

	{ 'L3MON4D3/LuaSnip',
		lazy = false,
		build = 'make install_jsregexp',
		dependencies = { 'honza/vim-snippets' },
		config = function ()
			require('luasnip').setup()
			require('luasnip.loaders.from_snipmate').load({ paths = '~/.local/share/nvim/lazy/vim-snippets/snippets' })
		end
	},

	-- Completion
	{ 'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'windwp/nvim-autopairs', 'uga-rosa/cmp-dictionary', 'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip' },
		lazy = false,
		config = function()
			-- nvim-cmp
			local cmp = require('cmp')
			local luasnip = require('luasnip')

			-- General sources
			local cmp_sources = {
				{
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				},
				{
					{ name = 'dictionary' },
					{ name = 'buffer' }
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
					['<CR>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({select = true})
						else
							fallback()
						end
					end, { 'i', 's' }),
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
						vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						-- Source
						vim_item.menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[LaTeX]",
						})[entry.source.name]
						return vim_item
					end
  },
			}

			-- Configure cmp sources
			local dict = require('cmp_dictionary')
			dict.setup {}

			local ft_dictionaries = {}
			for _, text_ft in ipairs(text_fts) do
				ft_dictionaries[text_ft] = vim.fn.stdpath('config') .. '/spell/en.dict'
			end
			dict.switcher({
				filetype = ft_dictionaries,
				spelllang = vim.fn.stdpath('config') .. '/spell/zero.dict'
			})

			-- Autopair
			local cmp_autopairs = require('nvim-autopairs.completion.cmp')
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end
	},

	-- Text editing plugins
	{ 'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		ft = treesitter_fts,
		dependencies = { 'HiPhish/nvim-ts-rainbow2' },
		config = function()
			-- nvim-treesitter
			require('nvim-treesitter.configs').setup {
				ensure_installed = treesitter_fts,
				highlight = {
					enable = true
				},
				rainbow = {
					enable = true
				}
			}

			require('nvim-treesitter.install').compilers = { 'gcc' }
		end
	},

	-- Competitive programming
	{ 'xeluxee/competitest.nvim',
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
	},

	-- Markdown
	-- install without yarn or npm
	{ 'iamcco/markdown-preview.nvim',
		build = ':call mkdp#util#install()',
		ft = text_fts,
		keys = { { '<Leader>m', ':MarkdownPreviewToggle<CR>' } }
	},

	{ 'antonk52/markdowny.nvim',
		ft = text_fts,
		keys = { { '<C-y>', ':lua require("markdowny").link()<CR>', mode = 'v', buffer = 0 } },
		config = function()
			require('markdowny').setup()
		end
	},

	{ 'preservim/vim-markdown',
		ft = text_fts,
		config = function()
			vim.g.vim_markdown_conceal = 1
		end
	},

	{ 'jakewvincent/mkdnflow.nvim',
		ft = text_fts,
		config = function()
			require('mkdnflow').setup()
		end
	},

	-- Movement
	{ 'ggandor/leap.nvim',
		keys = { { 's', ':lua require("leap").leap { target_windows = { vim.fn.win_getid() } }<CR>' } },
		lazy = false,
		config = function()
			require('leap').add_default_mappings()
		end
	},

	{ 'nmac427/guess-indent.nvim',
		lazy = false,
		config = function()
			require('guess-indent').setup {
				filetype_exclude = {
					'netrw',
					'tutor',
					'markdown',
					'txt',
				}
			}
		end
	},
}

-- No config plugins
local no_config = {
	['windwp/nvim-autopairs'] = 'nvim-autopairs',
	['lukas-reineke/indent-blankline.nvim' ] = 'indent_blankline',
	['lewis6991/gitsigns.nvim'] = 'gitsigns',
	['numToStr/Comment.nvim'] = 'Comment',
	['folke/which-key.nvim'] = 'which-key'
}

for plugin, name in pairs(no_config) do
	table.insert(plugins, {
		plugin,
		config = function()
			require(name).setup()
		end,
		lazy = false
	})
end

-- Lazy options
local opts = {
	defaults = {
		lazy = true
	}
}

-- Install plugins
require('lazy').setup(plugins, opts)
