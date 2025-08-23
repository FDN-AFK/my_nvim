return {
  'catppuccin/nvim',
  name = 'catppuccin',
  -- lazy = false,
  priority = 1000,

  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { dark = 'mocha' },
      transparent_background = false, -- disables setting the background color.
      float = {
        transparent = true, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = function(colors)
        local u = require 'catppuccin.utils.colors'
        return {
          -- bg = colors.mantle,
          CursorLineNr = { bg = u.blend(colors.overlay0, colors.base, 0.75), style = { 'bold' } },
          CursorLine = { bg = u.blend(colors.overlay0, colors.base, 0.45) },
          LspReferenceText = { bg = colors.surface2 },
          LspReferenceWrite = { bg = colors.surface2 },
          LspReferenceRead = { bg = colors.surface2 },
        }
      end,
      default_integrations = true,
      auto_integrations = false,
      integrations = {
        telescope = {
          enabled = false,
        },
        cmp = true,
        gitsigns = true,
        -- nvimtree = true,
        neotree = true,
        treesitter = true,
        notify = false,
        --mini = {
        --    enabled = true,
        --    indentscope_color = "",
        --},
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }

    -- Toggle background transparency
    local toggle_transparency = function()
      local catppuccin = require 'catppuccin'
      catppuccin.options.transparent_background = not catppuccin.options.transparent_background
      catppuccin.compile()
      vim.cmd [[colorscheme catppuccin]]
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })

    -- setup must be called before loading
    vim.cmd.colorscheme 'catppuccin'
  end,
}
