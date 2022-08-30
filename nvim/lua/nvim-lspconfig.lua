local lsp = require('lspconfig')
local lsp_configs = require('lspconfig.configs')
local lsp_util = require('lspconfig.util')

-- prosemd
--lsp_configs.prosemd = {
--  default_config = {
--    -- Update the path to prosemd-lsp
--    cmd = { "~/.local/bin/prosemd-lsp", "--stdio" },
--    filetypes = { "markdown" },
--    root_dir = function(fname)
--      return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
--    end,
--    settings = {},
--  }
--}
--lsp.prosemd.setup{ on_attach = on_attach }

-- pyright
-- lsp.pyright.setup{ on_attach = on_attach }

-- Set autocompletion
local servers = {}
for _, lsp_server in ipairs(servers) do
  lsp[lsp_server].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
