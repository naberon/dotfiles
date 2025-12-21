return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup {}
  end,
  keys = {
    { 'gf', '<CMD>Lspsaga finder<CR>', desc = 'Find references' },
    { 'gp', '<CMD>Lspsaga peek_definition<CR>', desc = 'Peek definition' },
    { 'gP', '<CMD>Lspsaga peek_type_definition<CR>', desc = 'Peek type definition' },
    { '<leader>ca', '<CMD>Lspsaga code_action<CR>', desc = 'Code action' },
    { '<leader>rn', '<CMD>Lspsaga rename<CR>', desc = 'Rename' },
    { '<leader>o', '<CMD>Lspsaga outline<CR>', desc = 'Toggle outline' },
    { 'K', '<CMD>Lspsaga hover_doc<CR>', desc = 'Hover doc' },
    { '[d', '<CMD>Lspsaga diagnostic_jump_prev<CR>', desc = 'Prev diagnostic' },
    { ']d', '<CMD>Lspsaga diagnostic_jump_next<CR>', desc = 'Next diagnostic' },
    { '<leader>sl', '<CMD>Lspsaga show_line_diagnostics<CR>', desc = 'Line diagnostics' },
  },
}
