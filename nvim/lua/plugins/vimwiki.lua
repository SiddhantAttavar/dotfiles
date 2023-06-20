return {
	-- Vimwiki
	{
		'vimwiki/vimwiki',
		cmd = { 'VimwikiIndex', 'VimwikiTabIndex', 'VimwikiUISelect', 'VimwikiDiaryIndex' },
		keys = {
			{ '<Leader>ww', ':VimwikiIndex<CR>' },
			{ '<Leader>wt', ':VimwikiTabIndex<CR>' },
			{ '<Leader>ws', ':VimwikiUISelect<CR>' },
			{ '<Leader>wi', ':VimwikiDiaryIndex<CR>' },
		},
		init = function()
			vim.g.vimwiki_list = {
				{
					path = '~/d/Others/vimwiki/',
					syntax = 'markdown',
					ext = '.md'
				}
			}

			vim.g.vimwiki_global_ext = 0
		end
	}
}
