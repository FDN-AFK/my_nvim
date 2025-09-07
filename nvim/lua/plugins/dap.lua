return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},

		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- NOTE: Add your own debuggers here
		"mfussenegger/nvim-dap-python",
		-- 'mrcjkb/rustaceanvim',
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- NOTE: check the required install online along with Mason debuggers
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the languages you want
				"debugpy",
				"codelldb",
			},
		})

		-- Basic debugging keymaps
		vim.keymap.set(
			"n",
			"<F5>",
			"<cmd>DapContinue<CR>",
			{ desc = "Debug: Start/Continue", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<F1>",
			"<cmd>DapStepInto<CR>",
			{ desc = "Debug: Step Into", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<F2>",
			"<cmd>DapStepInto<CR>",
			{ desc = "Debug: Step Over", noremap = true, silent = true }
		)
		vim.keymap.set("n", "<F3>", "<cmd>DapStepOut<CR>", { desc = "Debug: Step Out", noremap = true, silent = true })
		vim.keymap.set(
			"n",
			"<leader>b",
			"<cmd>DapToggleBreakpoint<CR>",
			{ desc = "Debug: Toggle Breakpoint", noremap = true, silent = true }
		)
		-- vim.keymap.set('n', '<leader>B', function()
		-- dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
		-- end, { desc = 'Debug: Set Breakpoint' })

		-- NOTE: Dap UI setup for more information, see |:help nvim-dap-ui|
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		-- Change breakpoint icons
		vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
		vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })

		local breakpoint_icons = vim.g.have_nerd_font
				and {
					Breakpoint = "",
					BreakpointCondition = "",
					BreakpointRejected = "",
					LogPoint = "",
					Stopped = "",
				}
			or {
				Breakpoint = "●",
				BreakpointCondition = "⊜",
				BreakpointRejected = "⊘",
				LogPoint = "◆",
				Stopped = "⭔",
			}

		for type, icon in pairs(breakpoint_icons) do
			local tp = "Dap" .. type
			local hl = (type == "Stopped") and "DapStop" or "DapBreak"

			vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		end

		-- Toggle to see last session result. Without this, you can't see session output.
		vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- NOTE: Install specific language config for DAP
		require("dap-python").setup("python3")

		-- NOTE: C compiler and DAP setup
		dap.adapters.codelldb = {
			type = "server",
			-- host = '127.0.0.1',
			-- port = 13000,
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
				detached = function()
					if vim.fn.has("win32") == 1 then
						return false
					else
						return true
					end
				end,
			},
		}
		dap.configurations.c = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function() -- Ask the user what executable wants to debug
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/program", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				terminal = "integrated",
				-- sourceLanguages = { 'rust' },
			},
		}
		-- require('rustaceanvim').setup({})
	end,
}
