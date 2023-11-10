if not vim.g.vscode then
	vim.opt_local.shiftwidth = 4
	vim.opt_local.tabstop = 4
	vim.opt_local.expandtab = false
	vim.cmd [[silent exec "GuessIndent"]]
end
