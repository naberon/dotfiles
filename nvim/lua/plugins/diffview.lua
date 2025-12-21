return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<CMD>DiffviewOpen<CR>', desc = 'Open diff view' },
    { '<leader>gh', '<CMD>DiffviewFileHistory %<CR>', desc = 'File history' },
    { '<leader>gH', '<CMD>DiffviewFileHistory<CR>', desc = 'Branch history' },
    { '<leader>gq', '<CMD>DiffviewClose<CR>', desc = 'Close diff view' },
  },
  config = function()
    require('diffview').setup {}
  end,
}
