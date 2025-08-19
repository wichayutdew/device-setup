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


-- Basic Keymap
vim.keymap.set({ 'n', 'v', 'x' }, 'Y', '"+y')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>qq", ":qa!<CR>")
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
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/nvim-tree/nvim-tree.lua' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/tpope/vim-surround' },
	{ src = 'https://github.com/github/copilot.vim' },
	{ src = 'https://github.com/akinsho/bufferline.nvim' },
	{ src = 'https://github.com/tomasky/bookmarks.nvim' },
	{ src = 'https://github.com/kdheepak/lazygit.nvim' },
})

-- Language Server, Syntax Highlight, Code Completion ( Mason and LSP)
require "mason".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "kotlin" },
	highlight = { enable = true }
})
vim.lsp.enable({ "lua_ls", "kotlin_language_server" })
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = "Code formatting" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gR", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,

})
vim.cmd("set completeopt+=noselect")


-- sidebar
require("nvim-tree").setup {
	view = { side = "right" }
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
require('telescope').setup()
require('telescope').load_extension('bookmarks')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>S', ':Telescope bookmarks list<CR>')


-- tab (buffer) management
require("bufferline").setup()
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>ww', ':bd<CR>', { desc = 'Close current buffer' })


-- Git integration
vim.keymap.set('n', 'lg', ':LazyGit<CR>')
