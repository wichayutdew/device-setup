vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.winborder = "rounded"
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true


-- Basic Keymap
vim.keymap.set("n", "<leader>re", ":w | :so<CR>")
vim.keymap.set({ 'n', 'v', 'x' }, 'Y', '"+y')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>qq", ":qa!<CR>")
vim.keymap.set("i", "jk", "<esc>")
-- Windows Navigation
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>wh", ":split<CR>")

-- Transparency and Colorscheme
vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Package Manager
vim.pack.add({
	--------------------- PRE-REQUISUTES ---------------------
	{ src = 'https://github.com/nvim-lua/plenary.nvim' }, -- Required by many plugins
	{ src = 'https://github.com/nvim-neotest/nvim-nio' }, -- Required by neotest
	{ src = 'https://github.com/MunifTanjim/nui.nvim' },
	--------------------- LSP ---------------------
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/scalameta/nvim-metals' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/github/copilot.vim' },
	--------------------- COMPLETION ---------------------
	{ src = 'https://github.com/L3MON4D3/LuaSnip' },
	{ src = 'https://github.com/saadparwaiz1/cmp_luasnip' },
	{ src = 'https://github.com/hrsh7th/cmp-buffer' },
	{ src = 'https://github.com/hrsh7th/cmp-path' },
	{ src = 'https://github.com/hrsh7th/nvim-cmp' },
	{ src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
	--------------------- TESTING ---------------------
	{ src = 'https://github.com/nvim-neotest/nvim-nio' },
	{ src = 'https://github.com/nvim-neotest/neotest' },
	{ src = 'https://github.com/codymikol/neotest-kotlin' },
	--------------------- DEBUGGING ---------------------
	{ src = 'https://github.com/mfussenegger/nvim-dap' },
	{ src = 'https://github.com/jay-babu/mason-nvim-dap.nvim' },
	{ src = 'https://github.com/theHamsta/nvim-dap-virtual-text' },
	{ src = 'https://github.com/rcarriga/nvim-dap-ui' },
	--------------------- FZF ---------------------
	{ src = 'https://github.com/nvim-tree/nvim-tree.lua' },
	{ src = 'https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	--------------------- GIT ---------------------
	{ src = 'https://github.com/kdheepak/lazygit.nvim' },
	{ src = 'https://github.com/lewis6991/gitsigns.nvim' }, -- For Git revert, Changes mark on left side
	--------------------- EXTRA ---------------------
	{ src = 'https://github.com/akinsho/bufferline.nvim' }, -- Tab manager
	{ src = 'https://github.com/tomasky/bookmarks.nvim' },
	{ src = 'https://github.com/folke/noice.nvim' },       -- Better command line and messages
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/tpope/vim-surround' },     -- Surroundings like parentheses, quotes, etc.
	{ src = 'https://github.com/unblevable/quick-scope' }, -- Highlight f, F, t, T
	{ src = 'https://github.com/echasnovski/mini.ai' },    -- e.g. q as " ' and b as ( [ {
})


-- Run & Debug
local dap = require("dap")
dap.adapters.ansible = {
	type = "executable",
	command = "python", -- or "/path/to/virtualenv/bin/python",
	args = { "-m", "ansibug", "dap" },
}
dap.configurations["yaml.ansible"] = {
	{
		type = "ansible",
		request = "launch",
		name = "Debug playbook",
		playbook = "${file}"
	},
}
dap.configurations.scala = {
	{
		type = "scala",
		request = "launch",
		name = "RunOrTest",
		metals = {
			runType = "runOrTestFile",
		},
	},
	{
		type = "scala",
		request = "launch",
		name = "Test Target",
		metals = {
			runType = "testTarget",
		},
	},
}

local dapui = require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup({
	enabled_commands = true,           -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false,  -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true,           -- show stop reason when stopped for exceptions
	commented = false,                 -- prefix virtual text with comment string
	only_first_definition = true,      -- only show virtual text at first definition (if there are multiple)
	all_references = false,            -- show virtual text on all all references of the variable (not only definitions)
	clear_on_continue = false,         -- clear virtual text on "continue" (might cause flickering when stepping)
	display_callback = function(variable, _, _, _, options)
		-- by default, strip out new line characters
		if options.virt_text_pos == 'inline' then
			return ' = ' .. variable.value:gsub("%s+", " ")
		else
			return variable.name .. ' = ' .. variable.value:gsub("%s+", " ")
		end
	end,
	virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
})

vim.keymap.set("n", "<leader>bb", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<leader>dc", ':DapContinue<CR>')
vim.keymap.set("n", "<leader>dr", ':DapToggleRepl<CR>')
vim.keymap.set("n", "<leader>dso", ':DapStepOver<CR>')
vim.keymap.set("n", "<leader>dsi", ':DapStepInto<CR>')
vim.keymap.set("n", "<leader>dsu", ':DapStepOut<CR>')
vim.keymap.set("n", "<leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set("n", "<leader>dd", function()
	dapui.toggle()
end)
---------------------- LSP (Syntax Highlight) ---------------------
require('mason').setup()
require("mason-nvim-dap").setup()
require('mason-lspconfig').setup()
---------------------- Code Completion ---------------------
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.lua_ls.setup({
	capabilities = lsp_capabilities
})
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 1 },
		{ name = 'buffer',   keyword_length = 3 },
		{ name = 'luasnip',  keyword_length = 2 },
	},
	window = {
		documentation = cmp.config.window.bordered()
	},
	formatting = {
		fields = { 'menu', 'abbr', 'kind' },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		['<Up>'] = cmp.mapping.select_prev_item(select_opts),
		['<Down>'] = cmp.mapping.select_next_item(select_opts),
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1

			if cmp.visible() then
				cmp.select_next_item(select_opts)
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),

		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
})
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = ''
	})
end

sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn', text = '▲' })
sign({ name = 'DiagnosticSignHint', text = '⚑' })
sign({ name = 'DiagnosticSignInfo', text = '»' })
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		border = 'rounded',
		source = 'always',
	},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "kotlin" },
	highlight = { enable = true }
})

vim.lsp.enable({ "lua_ls", "kotlin_language_server" })

-- Metals-specific setup
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'scala', 'sbt' },
	callback = function()
		local metals_config = require('metals').bare_config()

		metals_config.settings = {
			showImplicitArguments = true,
			showInferredType = true
		}
		metals_config.init_options.statusBarProvider = "on"
		metals_config.capabilities = lsp_capabilities
		metals_config.on_attach = function(client, bufnr)
			require("metals").setup_dap()
		end

		require('metals').initialize_or_attach(metals_config)
	end,
	group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
})

require('telescope').setup({
	pickers = {
		find_files = {
			hidden = true
		}
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {}
		}
	}
})
require("telescope").load_extension("ui-select")
require('telescope').load_extension('bookmarks')
require('telescope').load_extension('lsp_handlers')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = "Code formatting" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "gd", ':Telescope lsp_definitions<CR>', { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- sidebar
require("nvim-tree").setup {
	view = {
		side = "right",
		width = 70
	}
}
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- FuzzyFinder and Bookmarks
require('bookmarks').setup {
	sign_priority = 20,
	save_file = vim.fn.expand "$HOME/.bookmarks",
	on_attach = function(bufnr)
		local bm = require "bookmarks"
		vim.keymap.set("n", "<leader>s", bm.bookmark_toggle)
	end
}
vim.keymap.set('n', '<leader>S', ':Telescope bookmarks list<CR>')

-- tab (buffer) management
require("bufferline").setup()
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>ww', ':bd<CR>', { desc = 'Close current buffer' })


-- Git integration
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>')
vim.keymap.set('n', '<leader>zz', ':Gitsigns reset_hunk<CR>')

-- Testing & Debugging
require("neotest").setup({
	adapters = {
		require("neotest-kotlin")
	}
})
vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>ts", function() require("neotest").run.stop() end)
vim.keymap.set("n", "<leader>to", function() require("neotest").summary.toggle() end)
vim.keymap.set("n", "<leader>tp", function() require("neotest").output_panel.toggle() end)

vim.keymap.set('n', 'gt', ':A<CR>', { noremap = true, silent = true })

-- Miscellaneous
require('mini.ai').setup()

require("noice").setup({
	notify = {
		enabled = false
	}
})

require("lualine").setup {
	options = {
		theme = 'gruvbox'
	}
}
