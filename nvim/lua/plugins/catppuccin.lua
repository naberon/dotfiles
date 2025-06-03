return {
  'catppuccin/nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('catppuccin').setup {
      transparent_background = true,
      no_italic = false,
    }
    --
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
