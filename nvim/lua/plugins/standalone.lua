-- Standalone plugins with less than 10 lines of config go here
return {
	{
		-- Tmux & split window navigation
		"christoomey/vim-tmux-navigator",
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		  -- stylua: ignore
		  keys = {
		    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
		    { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
		    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
		    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
		  },
	},
}
