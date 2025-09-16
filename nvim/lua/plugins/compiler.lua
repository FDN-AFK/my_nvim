return {
    {
        -- This plugin
        'Zeioth/compiler.nvim',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo', 'CompilerStop' },
        dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },
        opts = {},
    },
    { -- The task runner we use
        'stevearc/overseer.nvim',
        commit = '6271cab7ccc4ca840faa93f54440ffae3a3918bd',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo', 'CompilerStop' },
        opts = {
            task_list = {
                direction = 'bottom',
                min_height = 15,
                max_height = 15,
                default_detail = 1,
            },
        },

        vim.keymap.set('n', '<F6>', '<cmd>CompilerOpen<CR>', { desc = 'Compiler: Start', noremap = true, silent = true }),
        -- vim.keymap.set('n', '<S-F6>', '<cmd>CompilerStop<CR>' .. '<cmd>CompilerRedo<CR>', { desc = 'Compiler: Redo ', noremap = true, silent = true }),
        vim.keymap.set('n', '<F8>', '<cmd>CompilerStop<CR>' .. '<cmd>CompilerToggleResults<CR>', { desc = 'Compiler: Stop', noremap = true, silent = true }),
        -- vim.keymap.set('n', '<S-F8>', '<cmd>CompilerToggleResults<CR>', { desc = 'Compiler: Toggle results', noremap = true, silent = true }),
    },
}
