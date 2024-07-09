return {
	-- Molten
	{
        'benlubas/molten-nvim',
        version = '^1.0.0',
        ft = { 'ipynb' },
        build = ':UpdateRemotePlugins',
        dependencies = { '3rd/image.nvim', 'quarto-dev/quarto-nvim' },
        keys = {
            { '<localleader>hi', ':MoltenInit<CR>' },
            { '<localleader>hr', ':MoltenReevaluateCell<CR>' },
            { '<localleader>hv', ':<C-u>MoltenEvaluateVisual<CR>gv', mode = 'v' },
            { '<localleader>hh', ':MoltenHideOutput<CR>' },
            { '<localleader>hs', ':MoltenShowOutput<CR>' },
            -- { '<localleader>hl', ':MoltenEvaluateLine<CR>' },
            { '<localleader>hd', ':MoltenDelete<CR>' },
            { '<localleader>hx', ':MoltenOpenInBrowser<CR>' },
        },
        init = function ()
            vim.g.molten_auto_open_output = false
            vim.g.molten_image_provider = 'image.nvim'
            vim.g.molten_wrap_output = true
            vim.g.molten_virt_text_output = true
            vim.g.molten_virt_lines_off_by_1 = true
        end
	},

    -- Jupytext
    {
        'GCBallesteros/jupytext.nvim',
        lazy = false,
        config = true,
        opts = {
            style = 'markdown',
            output_extension = 'md',
            force_ft = 'markdown'
        }
    },

    -- Quarto
    {
        'quarto-dev/quarto-nvim',
        dependencies = { 'jmbuhr/otter.nvim', 'nvim-treesitter/nvim-treesitter' },
        keys = {
            { "<localleader>hc", ':lua require("quarto.runner").run_cell()<CR>' },
            { "<localleader>ha", ':lua require("quarto.runner").run_above()<CR>' },
            { "<localleader>hA", ':lua require("quarto.runner").run_all()<CR>' },
            { "<localleader>hl", ':lua require("quarto.runner").run_line()<CR>' },
            { "<localleader>hr",  ':lua require("quarto.runner").run_range()<CR>', mode = 'v' },
        },
        ft = { 'quarto', 'markdown' },
        config = true,
        opts = {
            lspFeatures = {
                languages = { 'python' },
                chunks = 'all',
                diagnostics = {
                    enabled = true,
                    triggers = { 'BufWritePost' }
                },
                completion = {
                    enabled = true
                }
            },
            keymap = {
                hover = 'H',
                definition = 'gd',
                rename = '<Leader>r',
                references = 'gr',
                format = '<Leader>gf'
            },
            codeRunner = {
                enabled = true,
                default_method = 'molten'
            }
        }
    }
}
