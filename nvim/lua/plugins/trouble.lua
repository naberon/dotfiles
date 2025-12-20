return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- アイコン表示に必要
  opts = {
    -- ここにカスタム設定を書けますが、デフォルトでも十分使いやすいです
    modes = {
      diagnostics = {
        auto_open = false, -- エラーが出た時に勝手に開かない（手動で開く）
        auto_close = true, -- エラーがゼロになったら自動で閉じる
      },
    },
  },
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>cl',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
