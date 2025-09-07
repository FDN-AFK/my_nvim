-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the space bar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', opts)
-- to select all text in buffer
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

-- Move Text up and down in visual mode
vim.keymap.set('v', '<C-j>', ':m .+1<CR>==', opts)
vim.keymap.set('v', '<C-k>', ':m .-2<CR>==', opts)

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file in sudo mode
-- vim.keymap.set('n', '<SC-s>', '<cmd> w !sudo tee % >/dev/null <CR>', opts)

-- save file without auto-formatting
-- vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit all
vim.keymap.set('n', '<C-q>', '<cmd> qa <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- command using regex
-- vim.keymap.set('n', '<Leader>r', [[:%s/\n/,/g<CR>]], opts)
-- vim.keymap.set('n', '<Leader>rd', [[:g/\d\+6<CR>]], opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resizing with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<C-w>', '<cmd>bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<C-n>', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split Vertically', noremap = true, silent = true }) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', { desc = 'Split Horizontally', noremap = true, silent = true }) -- split window horizontally
vim.keymap.set('n', '<leader>e', '<C-w>=', { desc = 'Split Resizing Equally', noremap = true, silent = true }) -- make split windows equal width & height
vim.keymap.set('n', '<C-x>', ':close Neotree; close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open a new Tab', noremap = true, silent = true }) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close current Tab', noremap = true, silent = true }) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Go to next Tab', noremap = true, silent = true }) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Go to previous Tab', noremap = true, silent = true }) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
-- vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '<S-Tab>', '<gv', opts)
-- vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<Tab>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
