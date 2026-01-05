-- DAP (Debug Adapter Protocol) Configuration
return function()
	local dap = require("dap")
	local dapui = require("dapui")

	---------------------- DAP UI Setup ---------------------
	dapui.setup({
		icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.25 },
					{ id = "breakpoints", size = 0.25 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				size = 40,
				position = "left",
			},
			{
				elements = {
					{ id = "repl", size = 0.5 },
					{ id = "console", size = 0.5 },
				},
				size = 10,
				position = "bottom",
			},
		},
	})

	---------------------- DAP Virtual Text ---------------------
	require("nvim-dap-virtual-text").setup({
		enabled = true,
		enabled_commands = true,
		highlight_changed_variables = true,
		highlight_new_as_changed = false,
		show_stop_reason = true,
		commented = false,
		only_first_definition = true,
		all_references = false,
	})

	---------------------- Auto-open/close DAP UI ---------------------
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	---------------------- Breakpoint Signs Configuration ---------------------
	-- Set breakpoint icons
	vim.fn.sign_define("DapBreakpoint", {
		text = "●",
		texthl = "DapBreakpoint",
		linehl = "",
		numhl = "",
	})
	vim.fn.sign_define("DapStopped", {
		text = "▶",
		texthl = "DapStopped",
		linehl = "debugPC",
		numhl = "",
	})

	---------------------- JVM Debugger Configuration ---------------------
	dap.configurations.kotlin = {
		{
			type = "kotlin",
			request = "attach",
			name = "Debug (Attach) - Remote JVM on port 5005",
			port = 5005,
			args = {},
			projectRoot = vim.fn.getcwd,
			hostName = "localhost",
			timeout = 2000,
		},
	}

	dap.adapters.kotlin = {
		type = "executable",
		command = "kotlin-debug-adapter",
		options = { auto_continue_if_many_stopped = false },
	}
	---------------------- Telescope DAP Extension ---------------------
	require("telescope").load_extension("dap")

	---------------------- Keymaps ---------------------
	-- Breakpoint management
	vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
	vim.keymap.set("n", "<leader>bc", dap.clear_breakpoints, { desc = "Clear all breakpoints" })
	vim.keymap.set("n", "<leader>B", ":Telescope dap list_breakpoints<CR>", { desc = "List all breakpoints" })

	-- Debug execution - streamlined for attach workflow
	vim.keymap.set("n", "<leader>dd", dap.continue, { desc = "Attach/Continue debugging" })
	vim.keymap.set("n", "<leader>dD", dapui.toggle, { desc = "Toggle DAP UI" })

	-- Additional debug controls
	vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "Step over" })
	vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
	vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
	vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
end
