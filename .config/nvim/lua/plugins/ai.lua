-- AI Agent Configuration
return function()
	local opencode = require("opencode")

	-- Configuration
	vim.g.opencode_opts = {
		provider = {
			enabled = "snacks",
			snacks = { win = { width = 0.3 } },
		},
	}
	vim.o.autoread = true -- Enable autoread for live buffer reloading

	vim.keymap.set("n", "<leader>r", function()
		opencode.toggle()
	end, { desc = "Toggle opencode" })

	vim.keymap.set("v", "<leader>aa", function()
		opencode.ask("@this", { submit = true })
	end, { desc = "Send snippet to opencode" })

	vim.keymap.set({ "n", "x" }, "<leader>as", function()
		opencode.select()
	end, { desc = "Select opencode action" })
end
