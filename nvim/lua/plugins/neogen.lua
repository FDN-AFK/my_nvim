return {
    'danymat/neogen',
    config = true,
    version = '*',
    cmd = 'Neogen',
    keys = {
        {
            '<leader>ga',
            function()
                require('neogen').generate()
            end,
            desc = '[G]enerate [A]nnotations (Neogen)',
        },
    },
    opts = function(_, opts)
        if opts.snippet_engine ~= nil then
            return
        end

        -- local map = {
        --     ['LuaSnip'] = 'luasnip',
        --     ['mini.snippets'] = 'mini',
        --     --["nvim-snippy"] = "snippy",
        --     --["vim-vsnip"] = "vsnip",
        -- }

        -- for plugin, engine in pairs(map) do
        --     opts.snippet_engine = engine
        --     return
        -- end

        if vim.snippet then
            opts.snippet_engine = 'nvim'
        end
    end,
}
