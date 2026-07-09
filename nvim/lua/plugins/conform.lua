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
        prepend_args = function(self, bufnr)
          if vim.bo[bufnr].filetype == 'vue' then
            -- Vueのときは2スペース
            return { '--tab-width', '2' }
          end
          -- それ以外（JS/TSなど）は4スペース
          return { '--tab-width', '4' }
        end,
      },
    },
  },
}
