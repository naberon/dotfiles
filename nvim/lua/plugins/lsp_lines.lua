return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  event = 'LspAttach',
  config = function()
    require('lsp_lines').setup()
    vim.diagnostic.config { virtual_lines = false }
    vim.keymap.set('n', '<leader>tl', function()
      local config = vim.diagnostic.config()
      vim.diagnostic.config {
        virtual_lines = not config.virtual_lines,
        virtual_text = config.virtual_lines,
      }
    end, { desc = 'Toggle lsp_lines' })
  end,
}
