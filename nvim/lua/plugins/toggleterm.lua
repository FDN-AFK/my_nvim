return {
    -- amongst your other plugins
    'akinsho/toggleterm.nvim',
    version = '*',
    -- config = true,
    -- opts = {},

    config = function()
        require('toggleterm').setup {
            shade_terminals = false,
            auto_scroll = true,
            float_opts = {
                border = 'curved',
            },
        }
    end,
}
