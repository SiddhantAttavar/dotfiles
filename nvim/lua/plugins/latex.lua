return {
	{
	  'lervag/vimtex',
	  lazy = true,
	  ft = 'tex',
	  init = function()
		vim.g.vimtex_view_method = 'zathura'
		vim.g.vimtex_compiler_method = 'pdflatex'
	  end
	}
}
