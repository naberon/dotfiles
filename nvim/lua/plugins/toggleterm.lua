return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<C-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    }
  end,
  keys = {
    { '<C-\\>', desc = 'Toggle terminal' },
    { '<leader>tt', '<CMD>ToggleTerm direction=float<CR>', desc = 'Float terminal' },
    { '<leader>th', '<CMD>ToggleTerm direction=horizontal<CR>', desc = 'Horizontal terminal' },
    { '<leader>tv', '<CMD>ToggleTerm direction=vertical size=80<CR>', desc = 'Vertical terminal' },
  },
}
