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

local lsp_fts = { 'python', 'markdown', 'c', 'cpp', 'lua' }
local dap_fts = { 'python' }
local treesitter_fts = { 'python', 'cpp', 'java', 'markdown', 'lua' }
local text_fts = { 'markdown', 'txt' }

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

	{ 'VonHeikemen/lsp-zero.nvim',
		dependencies = { 'neovim/nvim-lspconfig', 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip' },
		lazy = false,
		config = function()
			local lsp = require('lsp-zero').preset({})
			local lspconfig = require('lspconfig')

			lsp.on_attach(function(client, bufnr)
				vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
					vim.lsp.diagnostic.on_publish_diagnostics, {
						signs = true,
						update_in_insert = false
					}
				)
				lsp.default_keymaps({buffer = bufnr})
			end)

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

			for server_name, config in pairs(server_config) do
				if (not lsp[server_name] == nil) and (not lsp[server_name].settings == nil) then
					lsp[server_name].settings = config
				end

				lspconfig[server_name].setup(config)
			end

			lsp.setup()
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

	-- Completion
	{ 'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'windwp/nvim-autopairs' },
		lazy = false,
		config = function()
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
			end

			-- nvim-cmp
			local cmp = require('cmp')

			-- General sources
			local cmp_basic_sources = {
				{
					{ name = 'path' },
				},
				{ { name = 'buffer' } }
			}

			-- Filetype specific configuration
			local ft_sources = {}
			for _, ft in ipairs(lsp_fts) do
				if ft_sources[ft] == nil then
					ft_sources[ft] = cmp_basic_sources
				end

				table.insert(ft_sources[ft][1], { name = 'nvim_lsp' })
			end

			cmp.setup {
				sources = cmp.config.sources(unpack(cmp_basic_sources)),
				mapping = cmp.mapping.preset.insert({
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
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
				})
			}

			for ft, cmp_sources in pairs(ft_sources) do
				cmp.setup.filetype(ft, { sources = cmp.config.sources(unpack(cmp_sources)) })
			end

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
		config = function()
			-- nvim-treesitter
			require('nvim-treesitter.configs').setup {
				ensure_installed = treesitter_fts,
				highlight = {
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
