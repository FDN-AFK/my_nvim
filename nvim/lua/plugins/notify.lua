return {
    'rcarriga/nvim-notify',

    config = function()
        vim.notify = require 'notify'

        vim.api.nvim_create_autocmd('BufWritePost', {
            callback = function()
                local notify_opts = { title = 'Notification', timeout = 1500, height = 100, width = 50 }
                vim.notify('File saved!', 'info', notify_opts) -- error, info, warn, debug, trace
            end,
        })
    end,
}
