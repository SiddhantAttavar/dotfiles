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

-- Lazy plugins
local plugins = {
	-- { 'foo/bar' },

	-- General settings
	{ 'tpope/vim-sensible', lazy = false },

	-- Onedark theme
	{ 'navarasu/onedark.nvim',
		init = function()
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
		cmd = { 'Files', 'History' },
		keys = { { '<C-p>', ':Files<CR>' } },
		config = function()
			vim.cmd [[command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'pistol {}']}, <bang>0)]]
		end
	},

	-- Git
	{ 'tpope/vim-fugitive', cmd = { 'Git', 'G' } },

	-- Icons
	{ 'kyazdani42/nvim-web-devicons', lazy = false },
	{ 'ryanoasis/vim-devicons', lazy = false },

	-- Dashboard
	{ 'goolord/alpha-nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		enabled = function()
			return vim.fn.argc() == 0
		end,
		init = function()
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
				hijack_netrw = false,
				disable_netrw = true,
				open_on_setup = false,
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
		cmd = 'ToggleTerm',
		keys = {
			{ '<C-f>', ':ToggleTerm<CR>' },
			{ '<C-f>', '<C-\\><C-n>:ToggleTerm<CR>', mode = 't' }
		},
		config = function()
			require('toggleterm').setup {
				winbar = {
					enabled = false
				}
			}
		end
	},

	-- Notifications
	{ 'rcarriga/nvim-notify',
		init = function()
			vim.notify = require('notify')
		end
	},


	-- Lualine
	{ 'nvim-lualine/lualine.nvim',
		dependencies = { 'SmiteshP/nvim-navic', 'lewis6991/gitsigns.nvim' },
		keys = {
			{ '<Leader>e', vim.diagnostic.open_float },
			{ '[d', vim.diagnostic.goto_prev },
			{ ']d', vim.diagnostic.goto_next },
			{ '<Leader>q', vim.diagnostic.setloclist }
		},
		init = function()
			local navic = require('nvim-navic')

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
							source = 'gitsigns_source'
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
					'fzf',
					'nvim-tree',
					'toggleterm'
				}
			}
		end
	},

	-- Browser nvim extension
	{ 'glacambre/firenvim',
		build = function() vim.fn['firenvim#install'](0) end,
		enabled = not not vim.g.started_by_firenvim,
		init = function()
			vim.g.firenvim_config = {
				localSettings = {
					['.*'] = {
						takeover = 'never',
						content = 'markdown'
					},
				}
			}
		end
	},

	-- LSP Lualine element
	{ 'SmiteshP/nvim-navic',
		config = function()
			require('nvim-navic').setup {
				highlight = true,
				depth_limit = 3
			}
		end
	},

	-- LSP extension plugins
	{ 'neovim/nvim-lspconfig',
		dependencies = { 'williamboman/mason.nvim', 'SmiteshP/nvim-navic', 'williamboman/mason-lspconfig.nvim' },
		ft = { 'python', 'markdown', 'c', 'cpp', 'lua' },
		config = function()
			-- nvim-lspconfig and mason
			require('mason').setup {}
			local lsp = require('lspconfig')

			-- on_attach callback function
			local on_attach = function(client, bufnr)
				vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
					signs = true,
					update_in_insert = false,
				}
				)

				if client.server_capabilities.documentSymbolProvider then
					require('nvim-navic').attach(client, bufnr)
				end

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

			-- configs for lsp servers
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

			-- setup LSPs
			require('mason-lspconfig').setup {
				ensure_installed = {
					'pylsp',
					'clangd',
					'prosemd_lsp',
					'lua_ls'
				}
			}

			require('mason-lspconfig').setup_handlers {
				function (server_name)
					local config = server_config[server_name]
					config.on_attach = on_attach
					lsp[server_name].setup(config)
				end
			}
		end
	},

	-- Debugging
	{ 'mfussenegger/nvim-dap',
		ft = { 'python' },
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

	-- Completion
	{ 'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-path', 'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip' },
		init = function()
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
			end

			-- nvim-cmp
			local cmp = require('cmp')
			local luasnip = require('luasnip')
			luasnip.setup {}

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
					['CR'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({select = true})
						else
							fallback()
						end
					end, { 'i', 's' })
				})
			}
		end
	},

	-- Text editing plugins
	{ 'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		ft = { 'python', 'cpp' },
		config = function()
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
		ft = 'markdown',
		keys = { { '<Leader>m', ':MarkdownPreviewToggle<CR>' } }
	},

	{ 'antonk52/markdowny.nvim',
		ft = { 'markdown', 'txt' },
		keys = { { '<C-y>', ':lua require("markdowny").link()<CR>', mode = 'v', buffer = 0 } },
		config = function()
			require('markdowny').setup()
		end
	},

	{ 'preservim/vim-markdown',
		ft = 'markdown'
	},

	{ 'jakewvincent/mkdnflow.nvim',
		ft = 'markdown',
		config = function()
			require('mkdnflow').setup()
		end
	},

	-- Movement
	{ 'ggandor/leap.nvim',
		init = function()
			require('leap').add_default_mappings()
		end
	},
}

-- No config plugins
local no_config = {
	['windwp/nvim-autopairs'] = 'nvim-autopairs',
	['lukas-reineke/indent-blankline.nvim' ] = 'indent_blankline',
	['lewis6991/gitsigns.nvim'] = 'gitsigns',
	['numToStr/Comment.nvim'] = 'Comment',
	['nmac427/guess-indent.nvim'] = 'guess-indent',
	['jose-elias-alvarez/null-ls.nvim'] = 'null-ls',
	['Pocco81/auto-save.nvim'] = 'auto-save',
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
