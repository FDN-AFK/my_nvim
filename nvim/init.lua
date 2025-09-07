require 'config.options'
require 'config.keymaps'
require 'config.snippets'

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup {
    require 'plugins.tokyonight',
    require 'plugins.snacks',
    require 'plugins.mini',
    require 'plugins.nvim-web-devicons',
    require 'plugins.comment-line',
    require 'plugins.telescope',
    require 'plugins.cmp',
    require 'plugins.lspconfig',
    require 'plugins.none-ls',
    require 'plugins.treesitter',
    require 'plugins.bufferline',
    require 'plugins.noice',
    require 'plugins.lualine',
    require 'plugins.symbol-usage',
    require 'plugins.standalone',
    require 'plugins.neogen',
    require 'plugins.markdown',
    require 'plugins.dap',
    require 'plugins.compiler',
    require 'plugins.gitsigns',
    require 'plugins.mini-diff',
    require 'plugins.inc-rename',
}
