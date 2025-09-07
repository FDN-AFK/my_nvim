return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	---@module 'render-markdown'
	opts = {},
	config = function()
		require("render-markdown").setup({
			completions = { lsp = { enabled = true } },
			file_types = { "markdown", "vimwiki" },
		})
	end,
}
