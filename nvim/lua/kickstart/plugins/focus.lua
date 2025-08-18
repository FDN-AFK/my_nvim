return {
  {
    'nvim-focus/focus.nvim',
    version = '*',
    config = function()
      require('focus').setup {
        enable = true, -- Enable module
        commands = true, -- Create Focus commands
        autoresize = {
          enable = true, -- Enable or disable auto-resizing of splits
          width = 120, -- Force width for the focused window
          -- height = 0, -- Force height for the focused window
          -- minwidth = 0, -- Force minimum width for the unfocused window
          -- minheight = 0, -- Force minimum height for the unfocused window
          --focusedwindow_minwidth = 0, --Force minimum width for the focused window
          -- focusedwindow_minheight = 0, --Force minimum height for the focused window
          -- height_quickfix = 10, -- Set the height of quickfix panel
        },
        split = {
          bufnew = true, -- Create blank buffer for new split windows
          tmux = false, -- Create tmux splits instead of neovim splits
        },
        ui = {
          winhighlight = true, -- Auto highlighting for focussed/unfocussed windows
        },
      }
    end,
  },
}
