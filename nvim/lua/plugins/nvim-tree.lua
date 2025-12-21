return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup {
      view = {
        width = 30,
      },
      filters = {
        dotfiles = false,
      },
    }
    vim.keymap.set('n', '<leader>e', '<CMD>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<leader>E', '<CMD>NvimTreeFindFile<CR>', { desc = 'Find current file in explorer' })
  end,
}
