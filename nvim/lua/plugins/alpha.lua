return {
   'goolord/alpha-nvim',
   dependencies = {
      'nvim-tree/nvim-web-devicons',
   },

   config = function()
      local alpha = require 'alpha'
      --local dashboard = require 'alpha.themes.startify'

      -- dashboard.section.header.val = {
      --    [[                                                    ]],
      --    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      --    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      --    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      --    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      --    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      --    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      --    [[                                                    ]],
      -- }

      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {

         [[          ▀████▀▄▄              ▄█ ]],
         [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
         [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
         [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
         [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
         [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
         [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
         [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
         [[   █   █  █      ▄▄           ▄▀   ]],
      }

      dashboard.section.buttons.val = {
         dashboard.button('\\', '  Open Neo-tree', '<cmd> Neotree reveal<CR>', { noremap = true, silent = true }),
         dashboard.button('f', '  Find file', '<cmd>Telescope find_files <CR>', { noremap = true, silent = true }),
         dashboard.button('e', '  New file', '<cmd>ene <BAR> startinsert <CR>', { noremap = true, silent = true }),
         dashboard.button('r', '  Recently used files', '<cmd>Telescope oldfiles <CR>', { noremap = true, silent = true }),
         dashboard.button('t', '  Find text', '<cmd>Telescope live_grep <CR>', { noremap = true, silent = true }),
         dashboard.button('t', '  Mason', '<cmd>Mason <CR>', { noremap = true, silent = true }),
         dashboard.button('t', '󰒲  Lazy', '<cmd>Lazy <CR>', { noremap = true, silent = true }),
         dashboard.button('c', '  Configuration', '<cmd>e ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true }),
         dashboard.button('q', '  Quit Neovim', '<cmd>qa<CR>', { noremap = true, silent = true }),
      }

      local function footer()
         return "Don't Stop Until You are Proud Fred..."
      end

      dashboard.section.footer.val = footer()

      dashboard.section.footer.opts.hl = 'Type'
      dashboard.section.header.opts.hl = 'Include'
      dashboard.section.buttons.opts.hl = 'Keyword'

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
   end,
}
