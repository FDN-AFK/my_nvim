return {
	"danymat/neogen",
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
	cmd = "Neogen",
	keys = {
		{
			"<leader>cn",
			function()
				require("neogen").generate()
			end,
			desc = "Generate Annotations (Neogen)",
		},
	},
	opts = function(_, opts)
		if opts.snippet_engine ~= nil then
			return
		end

		local map = {
			["LuaSnip"] = "luasnip",
			--["mini.snippets"] = "mini",
			--["nvim-snippy"] = "snippy",
			--["vim-vsnip"] = "vsnip",
		}

		for plugin, engine in pairs(map) do
			opts.snippet_engine = engine
			return
		end

		if vim.snippet then
			opts.snippet_engine = "nvim"
		end
	end,
}
