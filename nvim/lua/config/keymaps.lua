-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the space bar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- to select all text in buffer
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

-- Move Text up and down in visual mode
vim.api.nvim_set_keymap('x', '<C-j>', ":m '>+1<cr>gv=gv", opts)
vim.api.nvim_set_keymap('x', '<C-k>', ":m '<-2<cr>gv=gv", opts)
-- vim.keymap.set('v', '<C-k>', ':m .-2<CR>gv=gv', opts)
-- vim.keymap.set('v', '<C-j>', ':m .+1<CR>gv=gv', opts)

-- Moving cursor in insert mode
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)

-- To disable spellcheck
vim.keymap.set('n', '<leader>ssd', '<cmd>setlocal nospell<CR>', { desc = '[S]pellcheck [D]isable', noremap = true, silent = true }) -- split window vertically
vim.keymap.set('n', '<leader>ssu', '<cmd>setlocal spell spelllang=en_us<CR>', { desc = 'Active [S]pellcheck [U]S', noremap = true, silent = true }) -- split window vertically
vim.keymap.set('n', '<leader>ssf', '<cmd>setlocal spell spelllang=fr_fr<CR>', { desc = 'Active [S]pellcheck [F]R', noremap = true, silent = true }) -- split window vertically
vim.keymap.set('n', '<leader>sse', '<cmd>setlocal spell spelllang=es_mx<CR>', { desc = 'Active [S]pellcheck [E]S', noremap = true, silent = true }) -- split window vertically

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file in sudo mode
-- vim.keymap.set('n', '<SC-s>', '<cmd> w !sudo tee % >/dev/null <CR>', opts)

-- quit all
vim.keymap.set('n', '<C-q>', '<cmd> qa <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('i', '<C-z>', '<Esc>', opts)

-- create an executable script
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', opts)

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

-- Terminal keymaps
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w>', [[<Cmd>exit<CR>]], { noremap = true, silent = true })

-- Terminal Split Window
vim.keymap.set('n', '<leader>ts', '<cmd>ToggleTerm<CR>', { desc = '[T]oggle [T]erminal', noremap = true, silent = true }) -- split window vertically
vim.keymap.set(
    'n',
    '<leader>tf',
    '<cmd>ToggleTerm size=40 dir=~/Documents direction=float<CR>',
    { desc = '[T]erminal [F]loatting', noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    '<leader>th',
    '<cmd>ToggleTerm size=20 dir=~/Documents direction=horizontal<CR>',
    { desc = '[T]erminal [H]oritzontally', noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    '<leader>tv',
    '<cmd>ToggleTerm size=40 dir=~/Documents direction=vertical<CR>',
    { desc = '[T]erminal [V]ertically', noremap = true, silent = true }
)

vim.keymap.set(
    'n',
    '<leader>tt',
    '<cmd>ToggleTerm dir=~/Documents direction=tab name=documents<CR>',
    { desc = '[T]erminal [T]ab', noremap = true, silent = true }
)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = 'Split Vertically', noremap = true, silent = true }) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', { desc = 'Split Horizontally', noremap = true, silent = true }) -- split window horizontally
vim.keymap.set('n', '<leader>e', '<C-w>=', { desc = 'Split Resizing Equally', noremap = true, silent = true }) -- make split windows equal width & height
vim.keymap.set('n', '<C-x>', ':close<CR>', opts) -- close current split window

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
vim.keymap.set('v', '<S-Tab>', '<gv', opts)
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
