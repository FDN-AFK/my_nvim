return {
    'smjonas/inc-rename.nvim',
    opts = {},

    config = function()
        require('inc_rename').setup {
            hl_group = 'Substitute',
            preview_empty_name = false,
            show_message = true,
            -- whether to save the "IncRename" command in the command line history (set to false to prevent issues with
            -- navigating to older entries that may arise due to the behavior of command preview)
            -- save_in_cmdline_history = true,
            input_buffer_type = 'snacks',
            -- callback to run after renaming, receives the result table (from LSP handler) as an argument
            -- post_hook = nil,
        }
    end,
    vim.keymap.set('n', '<leader>rn', ':IncRename '),
}
