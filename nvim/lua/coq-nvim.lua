-- coq-nvim setup
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

-- Enable some language servers with the additional completion capabilities offered by coq_nvim
--local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
--for _, lsp in ipairs(servers) do
--  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
--    -- on_attach = my_custom_on_attach,
--  }))
--end
