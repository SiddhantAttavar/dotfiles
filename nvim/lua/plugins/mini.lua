-- mini.nvim: text editing and navigation modules that fill gaps not
-- covered by other plugins here (snacks takes dashboard/indent/explorer/
-- picker, nvim-cmp owns completion, lualine statusline, etc.)
return {
	{
		'nvim-mini/mini.nvim',
		version = false,
		lazy = false,
		config = function()
			-- Extended a/i textobjects: brackets, quotes, tags, function
			-- calls (ta/tf style), user prompt. Complements leap + surround
			require('mini.ai').setup({})

			-- Move lines/selections with Alt+hjkl
			require('mini.move').setup({})

			-- Inline hex color previews + FIXME/HACK/TODO/NOTE highlighting
			require('mini.hipatterns').setup({
				highlighters = {
					fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
					hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
					todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
					note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
					hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
				},
			})

			-- Evaluate/multiply/sort text operators.
			-- replace is disabled: its default 'gr' prefix would strip the
			-- LSP references mapping; exchange sits on 'gX' to keep 'gx'
			-- (URL open) free
			require('mini.operators').setup({
				evaluate = { prefix = 'g=' },
				exchange = { prefix = 'gX' },
				multiply = { prefix = 'gm' },
				replace = { prefix = '' },
				sort = { prefix = 'gs' },
			})

			-- ]/[ target navigation. Diagnostic target disabled: [d/']d
			-- already jump LSP diagnostics. The undo target makes u/<C-r>
			-- register undo states for bracketed traversal
			require('mini.bracketed').setup({
				diagnostic = { suffix = '' },
			})

			-- Repeating f/t char jumps (leap owns s/S only)
			require('mini.jump').setup({})

			-- Autopairs replacement: same default typing behavior (open
			-- pairs, over-type closers, <BS> removes pair, <CR> inside pair
			-- splits it)
			require('mini.pairs').setup({})

			-- Surround replacement. Under 'gS' so leap's instantly-firing
			-- 's' stays free; Visual-mode 'S' keeps the vim-surround key
			require('mini.surround').setup({
				mappings = vim.deepcopy({
					add = 'gsa',
					delete = 'gsd',
					replace = 'gsr',
					find = 'gsf',
					find_left = 'gsF',
					highlight = 'gsh',
				})
			})
			vim.keymap.set('x', 'S', function()
				require('mini.surround').add()
			end, {
				silent = true,
				nowait = true,
				desc = 'Add surrounding (vim-surround compatible)',
			})

			-- Interactive alignment (tabular replacement): ga aligns on a
			-- split pattern with modifiers, gA with live preview
			require('mini.align').setup({})
		end
	}
}
