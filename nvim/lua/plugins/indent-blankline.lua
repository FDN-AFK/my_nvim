return {
   'lukas-reineke/indent-blankline.nvim',
   main = 'ibl',
   opts = {
      indent = {
         char = '▏',
      },
      scope = {
         show_start = false,
         show_end = false,
         show_exact_scope = false,
      },
      exclude = {
         filetypes = {
            'help',
            'startify',
            'dashboard',
            'packer',
            'neogitstatus',
            'neo-tree',
            'Trouble',
         },
      },
   },
   config = function()
      require('ibl').setup()
      local highlight = {
         'RainbowLavander',
         -- 'RainbowYellow',
         -- 'RainbowBlue',
         -- 'RainbowOrange',
         -- 'RainbowGreen',
         'RainbowViolet',
         'RainbowCyan',
      }

      local hooks = require 'ibl.hooks'
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
         vim.api.nvim_set_hl(0, 'RainbowLavander', { fg = '#b4befe' })
         vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
         vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
         vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
         vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
         vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
         vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
      end)
      vim.g.rainbow_delimiters = { highlight = highlight }
      require('ibl').setup { scope = { highlight = highlight } }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
   end,
}
