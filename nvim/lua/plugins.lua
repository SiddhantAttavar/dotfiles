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
		cmd = 'Files',
		config = function()
			vim.cmd [[command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'pistol {}']}, <bang>0)]]
		end,
		lazy = false
	},

	-- Git
	{ 'tpope/vim-fugitive' },

	-- Icons
	{ 'kyazdani42/nvim-web-devicons' },
	{ 'ryanoasis/vim-devicons' },

	-- UI: Startup page, statusline, explorer etc.
	{ 'goolord/alpha-nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
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
		end,
		lazy = false
	},
	{ 'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeToggle',
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

	{ 'akinsho/toggleterm.nvim',
		cmd = 'ToggleTerm',
		config = function()
			require('toggleterm').setup {
				winbar = {
					enabled = false
				}
			}
		end
	},
	{ 'rcarriga/nvim-notify',
		init = function()
			vim.notify = require('notify')
		end
	},
	{ 'SmiteshP/nvim-navic',
		config = function()
			require('nvim-navic').setup {
				highlight = true,
				depth_limit = 3
			}
		end
	},

	-- Lualine
	{ 'nvim-lualine/lualine.nvim',
		dependencies = 'SmiteshP/nvim-navic',
		config = function()
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
		end,
		lazy = false
	},

	-- Browser nvim extension
	{ 'glacambre/firenvim',
		build = function() vim.fn['firenvim#install'](0) end,
		init = function()
			-- firenvim
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

	-- LSP
	{ 'neovim/nvim-lspconfig',
		config = function()
		end
	},

	-- LSP extension plugins
	{ 'L3MON4D3/LuaSnip' },
	{ 'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim', 'SmiteshP/nvim-navic', 'neovim/nvim-lspconfig' },
		config = function()
			-- nvim-lspconfig and mason
			require('mason').setup {}
			local lsp = require('lspconfig')
			local navic = require('nvim-navic')

			-- on_attach callback function
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
		end,
		lazy = false
	},
	{ 'mfussenegger/nvim-dap',
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
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline' },
		config = function()
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
					['CR'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({select = true})
						else
							fallback()
						end
					end, { 'i', 's' })
				})
			}
		end,
		lazy = false
    },

	-- Text editing plugins
	{ 'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
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
		end,
		lazy = false
	},

	-- Competitive programming
	{ 'xeluxee/competitest.nvim',
		dependencies = { 'MunifTanjim/nui.nvim' },
		cmd = { 'CompetiTestAdd', 'CompetiTestRun', 'CompetiTestReceive' },
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
	{ 'iamcco/markdown-preview.nvim', build = function() vim.fn['mkdp#util#install']() end },

	-- Movement
	{ 'ggandor/leap.nvim',
		config = function()
			_G.leap = function()
				require('leap').add_default_mappings()
			end
		end
	},
}

-- No config plugins
local no_config = {
	['windwp/nvim-autopairs'] = 'nvim-autopairs',
	['lukas-reineke/indent-blankline.nvim' ] = 'indent_blankline',
	['lewis6991/gitsigns.nvim'] = 'gitsigns',
	['numToStr/Comment.nvim' ] = 'Comment',
	['nmac427/guess-indent.nvim' ] = 'guess-indent',
	['jose-elias-alvarez/null-ls.nvim' ] = 'null-ls',
	['saadparwaiz1/cmp_luasnip' ] = 'luasnip'
}
for plugin, name in pairs(no_config) do
	table.insert(plugins, {
		plugin,
		config = function()
			require(name).setup {}
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
