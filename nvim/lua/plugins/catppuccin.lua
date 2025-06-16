return {
  'catppuccin/nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('catppuccin').setup {
      transparent_background = true,
      no_italic = true,

      blink_cmp = {
        style = 'bordered',
      },

      gitsigns = true,
      telescope = {
        enabled = true,
        -- style = "nvchad"
      },
      custom_highlights = function(colors)
        return {
          NormalFloat = { bg = colors.mantle },
          TelescopeNormal = { link = 'NormalFloat' },
          Pmenu = { bg = colors.mantle },
        }
      end,
    }

    --
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
