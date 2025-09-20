vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999
vim.opt.wrap = false
vim.api.nvim_set_option_value("colorcolumn", "80", {})
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
vim.keymap.set("n", "<leader>ww", ":bd<CR>")
vim.keymap.set({ "n", "v", "x" }, "Y", '"+y')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "i", "zzi")
vim.keymap.set("n", "a", "zza")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>qq", ":qa<CR>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "//", ":noh<CR>")
-- Windows Navigation
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>wh", ":split<CR>")

-- Package Manager
vim.pack.add({
	--------------------- PRE-REQUISUTES ---------------------
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- Required by many plugins
	{ src = "https://github.com/nvim-neotest/nvim-nio" }, -- Required by neotest
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- required by leetcode nvim and other packages
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- add icons
	{ src = "https://github.com/tree-sitter/tree-sitter-html" }, -- required by leetcode nvim
	{ src = "https://github.com/nvim-neotest/nvim-nio" }, -- required by neotest
	--------------------- LSP ---------------------
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/scalameta/nvim-metals" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	--------------------- COMPLETION ---------------------
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/zbirenbaum/copilot-cmp" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, -- render markdown
	--------------------- DEBUGGING ---------------------
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/jay-babu/mason-nvim-dap.nvim" },
	{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-telescope/telescope-dap.nvim" },
	--------------------- TESTING ---------------------
	{ src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/codymikol/neotest-kotlin" },
	--------------------- FZF ---------------------
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	--------------------- GIT ---------------------
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }, -- For Git revert, Changes mark on left side
	--------------------- MINI ---------------------
	{ src = "https://github.com/nvim-mini/mini.surround" }, -- Surroundings like parentheses, quotes, etc.
	{ src = "https://github.com/echasnovski/mini.ai" }, -- e.g. q as " ' and b as ( [ {
	{ src = "https://github.com/nvim-mini/mini.files" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.cursorword" },
	--------------------- EXTRA ---------------------
	{ src = "https://github.com/folke/flash.nvim" },
	{ src = "https://github.com/tomasky/bookmarks.nvim" },
	{ src = "https://github.com/f4z3r/gruvbox-material.nvim" },
	{ src = "https://github.com/folke/noice.nvim" }, -- Better command line and messages
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/kawre/leetcode.nvim" }, -- doing leetcode inside neovim
})

-- Transparency and Colorscheme
require("gruvbox-material").setup({
	italics = true,
	contrast = "medium",
	comments = {
		italics = true,
	},
	background = {
		transparent = true,
	},
})

-- Run & Debug
local dap = require("dap")
-- kotlin dap
dap.adapters.kotlin = {
	type = "executable",
	command = "kotlin-debug-adapter",
	options = { auto_continue_if_many_stopped = false },
}

local function get_kotlin_subproject()
	local file = vim.fn.expand("%:p")
	local workspace = vim.fn.getcwd()
	local rel = file:sub(#workspace + 2) -- +2 to skip the trailing slash
	local subproject = rel:match("([^/]+)/")
	if subproject then
		return workspace .. "/" .. subproject
	else
		return workspace
	end
end

local function get_kotlin_main_class()
	local file = vim.fn.expand("%:p")
	local rel = file:match("src.*/kotlin/(.*)%.kt$")
	if rel then
		return rel:gsub("/", ".") .. "Kt"
	end
	return vim.fn.input("Main class (e.g. org.example.AppKt): ")
end

require("dap").configurations.kotlin = {
	{
		type = "kotlin",
		request = "launch",
		name = "Launch current Kotlin file",
		mainClass = get_kotlin_main_class,
		cwd = get_kotlin_subproject,
		projectRoot = get_kotlin_subproject,
		classPaths = function()
			local subproject = get_kotlin_subproject()
			return { subproject .. "/build/classes/kotlin/main" }
		end,
		args = {},
	},
}

-- scala dap
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
dapui.setup({})
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
require("nvim-dap-virtual-text").setup({})

vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>bc", dap.clear_breakpoints)
vim.keymap.set("n", "<leader>bB", require("telescope").extensions.dap.list_breakpoints)
vim.keymap.set("n", "<leader>db", dapui.toggle)
vim.keymap.set("n", "<leader>dd", dap.continue)

---------------------- LSP (Syntax Highlight) ---------------------
require("mason").setup()
require("mason-nvim-dap").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"kotlin_language_server",
		"kotlin-debug-adapter",
		"cucumber_language_server",
		"reformat-gherkin",
		"markdownlint",
	},
})
require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
})
---------------------- Code Completion ---------------------
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
	capabilities = lsp_capabilities,
})

-- Kotlin
lspconfig.kotlin_language_server.setup({
	capabilities = lsp_capabilities,
	root_dir = function(fname)
		local util = require("lspconfig.util")
		-- Gradle-only patterns for cross-build projects
		local patterns = {
			"settings.gradle.kts",
			"settings.gradle",
			"build.gradle.kts",
			"build.gradle",
			".git",
		}

		return util.root_pattern(unpack(patterns))(fname)
	end,
	settings = {
		kotlin = {
			jvmOptions = {
				"-Xms1g",
				"-Xmx8g",
			},
			indexing = {
				enabled = true,
			},
			sourcePath = {
				enabled = true,
			},
		},
	},
	init_options = {
		preferences = {
			includeDecompiled = false,
			includeLibrarySources = true,
		},
		workspaceFolders = true,
	},
})
-- Scala
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt" },
	callback = function()
		local metals_config = require("metals").bare_config()

		metals_config.settings = {
			showImplicitArguments = true,
			showInferredType = true,
			bloopSbtAlreadyInstalled = true,
		}
		metals_config.init_options.statusBarProvider = "on"
		metals_config.capabilities = lsp_capabilities
		metals_config.on_attach = function(_, _)
			require("metals").setup_dap()

			vim.keymap.set("n", "<leader>mc", function()
				require("telescope").extensions.metals.commands()
			end, { buffer = bufnr, desc = "Metals commands" })
		end

		require("metals").initialize_or_attach(metals_config)
	end,
	group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }
require("luasnip.loaders.from_vscode").lazy_load()
require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
require("copilot_cmp").setup({})
local cmp = require("cmp")
local luasnip = require("luasnip")
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "copilot", group_index = 2 },
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "luasnip", group_index = 2 },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				copilot = "",
				nvim_lsp = "λ",
				luasnip = "⋗",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			local col = vim.fn.col(".") - 1

			if cmp.visible() then
				cmp.select_next_item(select_opts)
			elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
				fallback()
			else
				cmp.complete()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "✘" })
sign({ name = "DiagnosticSignWarn", text = "▲" })
sign({ name = "DiagnosticSignHint", text = "⚑" })
sign({ name = "DiagnosticSignInfo", text = "»" })
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "kotlin", "html", "scala" },
	highlight = { enable = true },
})
vim.lsp.enable({ "lua_ls", "kotlin_language_server", "cucumber_language_server" })

-- Formatter
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		kotlin = { "spotless_gradle" },
		markdown = { "markdownlint" },
		gherkin = { "reformat-gherkin" },
	},
})

local neotest = require("neotest")
neotest.setup({
	running = {
		strategy = "dap",
	},
	adapters = { require("neotest-kotlin") },
})
vim.keymap.set("n", "<leader>tt", function()
	neotest.run.run(vim.fn.expand("%"))
end)
vim.keymap.set("n", "<leader>ts", neotest.run.stop)
vim.keymap.set("n", "<leader>to", neotest.summary.toggle)
vim.keymap.set("n", "<leader>tp", neotest.output_panel.toggle)
-- Telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
			n = {
				["q"] = require("telescope.actions").close,
			},
		},
		wrap_results = true,
		layout_strategy = "flex",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				width = 0.9,
				height = 0.9,
				preview_width = 0.5,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
require("telescope").load_extension("ui-select")
require("telescope").load_extension("bookmarks")
require("telescope").load_extension("lsp_handlers")
require("telescope").load_extension("dap")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope list buffers" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 20000,
	})
end, { desc = "Format file or range" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "gd", function()
	builtin.lsp_definitions({
		file_ignore_patterns = { "%.class$" },
		path_display = { "smart" },
	})
end, { desc = "Go to definition (source only)" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Find references" })
vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- FuzzyFinder and Bookmarks
require("bookmarks").setup({
	sign_priority = 20,
	save_file = vim.fn.expand("$HOME/.bookmarks"),
	on_attach = function(_)
		local bm = require("bookmarks")
		vim.keymap.set("n", "<leader>s", bm.bookmark_toggle)
	end,
})
vim.keymap.set("n", "<leader>S", ":Telescope bookmarks list<CR>")

-- Git integration
vim.keymap.set({ "n", "v" }, "<leader>zz", ":Gitsigns reset_hunk<CR>")

-- Mini
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.files").setup()
vim.keymap.set("n", "<leader>e", function()
	if not MiniFiles.close() then
		MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	end
end)
require("mini.pairs").setup()
require("mini.cursorword").setup()

-- Miscellaneous
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

local flash = require("flash")
flash.setup({
	mode = {
		search = {
			enabled = false,
		},
	},
})
vim.keymap.set("n", "<leader>/", flash.jump)

require("noice").setup({ notify = { enabled = false } })
require("lualine").setup({
	options = {
		theme = require("gruvbox-material.lualine").theme("medium"),
	},
})
require("ibl").setup({})

-- leetcode
require("leetcode").setup({
	arg = "leetcode.nvim",
	lang = "kotlin",
	storage = {
		home = vim.fn.stdpath("data") .. "/leetcode",
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},
	plugins = {
		non_standalone = false,
	},
	logging = true,
	cache = {
		update_interval = 60 * 60 * 24 * 7,
	},
	editor = {
		reset_previous_code = true,
		fold_imports = true,
	},
	console = {
		open_on_runcode = true,
		dir = "row",
		size = {
			width = "90%",
			height = "75%",
		},
		result = {
			size = "70%",
		},
		testcase = {
			virt_text = true,
			size = "30%",
		},
	},
	description = {
		position = "right",
		width = "60%",
		show_stats = true,
	},
	keys = {
		toggle = { "q" },
		confirm = { "<CR>" },
		reset_testcases = "r",
		use_testcase = "U",
		focus_testcases = "H",
		focus_result = "L",
	},
	image_support = false,
	theme = {
		["alt"] = {
			bg = "#FFFFFF",
		},
		["normal"] = {
			fg = "#EA4AAA",
		},
	},
})

vim.keymap.set("n", "<leader>lf", ":Leet list<CR>")
vim.keymap.set("n", "<leader>le", ":Leet desc<CR>")
vim.keymap.set("n", "<leader>ld", ":Leet run<CR>")
vim.keymap.set("n", "<leader>lr", ":Leet submit<CR>")
vim.keymap.set("n", "<leader>lgx", ":Leet open<CR>")
