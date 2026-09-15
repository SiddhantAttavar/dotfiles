-- Opaque routing label required by the OpenCode Go gateway on every request
-- (anomalyco/opencode#47763); not a secret, any stable UUID works
local OPENCODE_SESSION_ID = '6d6a2f1a-54af-4f00-a4f5-6a1f2b3c4d5e'

-- Read an API key from opencode's credential store so minuet reuses the
-- existing subscriptions instead of separate env vars
local opencode_auth_keys = {}
local function opencode_auth_key(provider)
	if opencode_auth_keys[provider] then
		return opencode_auth_keys[provider]
	end
	local ok, content = pcall(vim.fn.readfile, vim.fn.expand('~/.local/share/opencode/auth.json'))
	if not ok then
		return nil
	end
	local ok_json, auth = pcall(vim.json.decode, table.concat(content, '\n'))
	if not ok_json or type(auth) ~= 'table' or type(auth[provider]) ~= 'table' then
		return nil
	end
	opencode_auth_keys[provider] = auth[provider].key
	return opencode_auth_keys[provider]
end

-- The OpenCode TUI command, shared by server start + the toggle keymap
local opencode_cmd = 'opencode --port'
local terminal_opts = {
	win = {
		position = 'right',
		enter = false,
		keys = {
			-- Single <esc> exits terminal mode; it is never forwarded to
			-- OpenCode, so its TUI interrupt stays silent. Every field of
			-- the default term_normal must be overridden in full (the
			-- style merge would otherwise keep its expr/desc)
			term_normal = { '<esc>', function() vim.cmd('stopinsert') end, mode = 't', expr = false, desc = 'Exit terminal mode' },
		},
	},
}

return {
	-- Opencode (nickjvandyke): pairs with OpenCode's TUI running in a
	-- snacks terminal; prompts from nvim inject editor context (@this,
	-- @diagnostics, ...). Range selections are appended to the prompt via
	-- the <Leader>oo/oO operators
	{
		'nickjvandyke/opencode.nvim',
		dependencies = { 'folke/snacks.nvim' },
		keys = {
			{ '<Leader>oc', function() require('snacks.terminal').toggle(opencode_cmd, terminal_opts) end, desc = 'Opencode: toggle TUI' },
			{ '<Leader>oa', function() require('opencode').ask('@this: ') end, desc = 'Opencode: ask', mode = { 'n', 'x' } },
			{ '<Leader>os', function() require('opencode').select() end, desc = 'Opencode: select', mode = { 'n', 'x' } },
			{ '<Leader>oi', function() require('opencode').command('session.interrupt') end, desc = 'Opencode: interrupt session' },
			{ '<Leader>oA', function() require('opencode').command('agent.cycle') end, desc = 'Opencode: cycle agent' },
			-- Append selection/range/line to the OpenCode prompt
			{ '<Leader>oo', function() return require('opencode').operator('@this ') end, desc = 'Opencode: append selection', expr = true, mode = { 'n', 'x' } },
			{ '<Leader>oO', function() return require('opencode').operator('@this ') .. '_' end, desc = 'Opencode: append line', expr = true },
		},
		config = function()
			vim.g.opencode_opts = {
				server = {
					start = function () require('snacks.terminal').open(opencode_cmd, terminal_opts) end
				}
			}
		end,
	},

	-- Minuet AI: inline completions (ghost text) via OpenCode Go
	{
		'milanglacier/minuet-ai.nvim',
		-- Load lazily: only on <Leader>ot / <Leader>oe / :Minuet. Enabling
		-- completions turns on the current buffer; buffers opened afterwards
		-- get auto-trigger via minuet's FileType autocmd
		cmd = 'Minuet',
		keys = {
			{ '<Leader>ot', '<cmd>Minuet virtualtext toggle<CR>', desc = 'Minuet: toggle completions' },
			{ '<Leader>oe', '<cmd>Minuet virtualtext enable<CR>', desc = 'Minuet: enable completions' },
		},
		opts = {
			provider = 'openai_compatible',
			request_timeout = 2.5,
			throttle = 1500,
			debounce = 600,
			virtualtext = {
				auto_trigger_ft = { '*' },
				auto_trigger_ignore_ft = {
					'opencode', 'opencode_output', 'opencode_ask', 'snacks_terminal',
					'TelescopePrompt', 'gitcommit', 'help', 'qf'
				},
				keymap = {
					-- <Tab> accept is wired into the nvim-cmp handler in cmp.lua
					next = '<Leader>sn',
					prev = '<Leader>sp',
					dismiss = '<Leader>sd',
					accept_line = '<A-a>'
				}
			},
			provider_options = {
				openai_compatible = {
					api_key = function() return opencode_auth_key('opencode-go') end,
					end_point = 'https://opencode.ai/zen/go/v1/chat/completions',
					model = 'qwen3.8-flash',
					name = 'Opencode',
					optional = {
						max_tokens = 128,
						top_p = 0.9,
						reasoning_effort = 'none'
					},
					-- The Go gateway requires a session routing header
					-- (anomalyco/opencode#47763)
					transform = {
						function(data)
							data.headers['x-opencode-session'] = OPENCODE_SESSION_ID
							return data
						end
					}
				}
			},
			presets = {
				openrouter = {
					provider = 'openai_compatible',
					provider_options = {
						openai_compatible = {
							api_key = function() return opencode_auth_key('openrouter') end,
							end_point = 'https://openrouter.ai/api/v1/chat/completions',
							model = 'deepseek/deepseek-v4-flash',
							name = 'Openrouter',
							optional = {
								max_tokens = 128,
								top_p = 0.9,
								reasoning = { effort = 'none' },
								provider = { sort = 'throughput' }
							}
						}
					}
				}
			}
		}
	}
}
