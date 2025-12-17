return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
    'nvim-telescope/telescope.nvim', -- キーバインドで利用するため依存に追加
  },
  config = function()
    -- 1. 外部設定（ハンドラ・キーマップ）のロード
    local handlers = require 'configs.lsp_handlers'
    require 'configs.diagnostics'

    local on_attach = handlers.on_attach
    local capabilities = handlers.capabilities

    -- Masonのパス取得
    local mason_path = vim.fn.expand '$MASON'
    local vue_ls_path = mason_path .. '/packages/vue-language-server'
    local vue_server_dir = vue_ls_path .. '/node_modules/@vue/language-server'
    local vue_server_exec = vue_ls_path .. '/node_modules/@vue/language-server/bin/vue-language-server.js'

    -- 2. ts_ls の設定 (Built-in 方式)
    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_server_dir,
            languages = { 'vue' },
          },
        },
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      -- 0.11では root_dir も設定に含めることが可能です
      root_dir = vim.fs.root(0, { 'tsconfig.json', 'package.json', '.git' }),
    })

    -- 3. vue_ls の設定 (Built-in 方式)
    vim.lsp.config('vue_ls', {
      capabilities = capabilities,
      cmd = { 'node', vue_server_exec, '--stdio' },
      init_options = {
        vue = { hybridMode = true },
      },
      filetypes = { 'vue' },
      root_dir = vim.fs.root(0, { 'package.json', '.git' }),
    })

    -- 4. サーバーの有効化
    vim.lsp.enable { 'ts_ls', 'vue_ls' }

    -- 5. Mason Tool Installer
    require('mason-tool-installer').setup {
      ensure_installed = { 'stylua', 'intelephense', 'cssls', 'typescript-language-server', 'vue-language-server', 'lua_ls' },
    }

    -- 6. 他のサーバーの自動セットアップ (mason-lspconfig)
    local lspconfig = require 'lspconfig'
    require('mason-lspconfig').setup {
      handlers = {
        -- 手動設定したものはハンドラを空にして、二重起動を防ぐ
        ['ts_ls'] = function() end,
        ['vue_ls'] = function() end,
        ['volar'] = function() end, -- 互換性のための保険
        function(server_name)
          -- その他（lua_ls, cssls等）は従来通り setup
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,
      },
    }
  end,
}
