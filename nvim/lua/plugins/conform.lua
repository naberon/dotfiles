return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      vue = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
    },
    -- ここから追記：Prettier の挙動を強制的に上書きします
    formatters = {
      prettier = {
        -- 4スペース、タブ不使用の設定を引数で渡す
        prepend_args = { '--tab-width', '4', '--no-use-tabs' },
      },
    },
  },
}
