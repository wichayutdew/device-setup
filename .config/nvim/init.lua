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
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Basic Keymap
vim.keymap.set("n", "<leader>re", ":w | :so<CR>", { desc = "Resource nvim config" })
vim.keymap.set("n", "<leader>ww", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set({ "n", "v", "x" }, "Y", '"+y')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "i", "zzi")
vim.keymap.set("n", "a", "zza")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Exit Neovim" })
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "//", ":noh<CR>")
-- Windows Navigation
vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>wh", ":split<CR>", { desc = "Split horizontally" })

-- Package Manager
vim.pack.add({
	--------------------- PRE-REQUISUTES ---------------------
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- Required by many plugins
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- required by leetcode nvim and other packages
	{ src = "https://github.com/tree-sitter/tree-sitter-html" }, -- required by leetcode nvim
	--------------------- LSP ---------------------
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/gbrlsnchs/telescope-lsp-handlers.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	--------------------- COMPLETION ---------------------
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, -- render markdown
	--------------------- FZF ---------------------
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	--------------------- MINI ---------------------
	{ src = "https://github.com/nvim-mini/mini.icons" }, -- add icons
	{ src = "https://github.com/nvim-mini/mini.surround" }, -- Surroundings like parentheses, quotes, etc.
	{ src = "https://github.com/echasnovski/mini.ai" }, -- e.g. q as " ' and b as ( [ {
	{ src = "https://github.com/nvim-mini/mini.files" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.cursorword" },
	{ src = "https://github.com/nvim-mini/mini.diff" },
	{ src = "https://github.com/nvim-mini/mini.clue" },
	{ src = "https://github.com/nvim-mini/mini.jump" },
	{ src = "https://github.com/nvim-mini/mini.jump2d" },
	--------------------- EXTRA ---------------------
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
	contrast = "soft",
	comments = {
		italics = true,
	},
	background = {
		transparent = true,
	},
	customize = function(g, o)
		if g == "Comment" then
			o.fg = "#8A8A8A"
		end
		if g == "LineNr" then
			o.fg = "#8A8A8A"
		end
		if g == "CursorLineNr" then
			o.fg = "#FF8200"
			o.bold = true
		end
		return o
	end,
})

---------------------- LSP (Syntax Highlight) ---------------------
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"rust_analyzer",
		"markdownlint",
		"marksman",
	},
})
require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
})
---------------------- Code Completion ---------------------
-- Lua
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("lua_ls", {
	capabilities = lsp_capabilities,
	filetypes = { "lua" },
})

-- Rust
vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {},
  },
})

-- Markdown
vim.lsp.config("marksman", {
	capabilities = lsp_capabilities,
	filetypes = { "markdown" },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "rust", "markdown" },
	highlight = { enable = true },
})
vim.lsp.enable({ "lua_ls", "rust_analyzer", "marksman" })

vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	sources = {
		{ name = "nvim_lsp", group_index = 2 },
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
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
-- Formatter
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		markdown = { "markdownlint" },
	},
})

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
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope list buffers" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
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
		vim.keymap.set("n", "<leader>s", bm.bookmark_toggle, { desc = "Add bookmark" })
	end,
})
vim.keymap.set("n", "<leader>S", ":Telescope bookmarks list<CR>", { desc = "List all bookmarks" })

-- Mini
require("mini.icons").setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.files").setup()
require("mini.diff").setup({
	view = {
		style = "sign",
	},
	mappings = {
		reset = "<leader>zz",
	},
})
vim.keymap.set("n", "<leader>e", function()
	if not MiniFiles.close() then
		MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	end
end, { desc = "Open file tree" })
require("mini.pairs").setup()
require("mini.cursorword").setup()
require("mini.clue").setup({
	triggers = {
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },
	},
	clues = {
		require("mini.clue").gen_clues.builtin_completion(),
	},
	window = {
		delay = 100,
	},
})
require("mini.jump").setup()
require("mini.jump2d").setup()

-- Miscellaneous
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

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

vim.keymap.set("n", "<leader>lf", ":Leet list<CR>", { desc = "List all Leetcode question" })
vim.keymap.set("n", "<leader>le", ":Leet desc<CR>", { desc = "Toggle question description" })
vim.keymap.set("n", "<leader>ld", ":Leet run<CR>", { desc = "Run test" })
vim.keymap.set("n", "<leader>lr", ":Leet Submit<CR>", { desc = "Submit" })
vim.keymap.set("n", "<leader>lgx", ":Leet Open<CR>", { desc = "Open in browser" })
