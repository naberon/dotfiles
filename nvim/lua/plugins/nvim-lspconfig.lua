return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'saghen/blink.cmp',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local handlers = require 'configs.lsp_handlers'
    require 'configs.diagnostics'

    local on_attach = handlers.on_attach
    local capabilities = handlers.capabilities

    -- Masonのパス取得
    local mason_path = vim.fn.expand '$MASON'
    local vue_ls_path = mason_path .. '/packages/vue-language-server'
    local vue_server_dir = vue_ls_path .. '/node_modules/@vue/language-server'
    local vue_server_exec = vue_ls_path .. '/node_modules/@vue/language-server/bin/vue-language-server.js'

    -- 2. ts_ls の設定
    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      on_attach = on_attach,
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
      root_dir = vim.fs.root(0, { 'tsconfig.json', 'package.json', '.git' }),
    })

    -- 3. vue_ls の設定
    vim.lsp.config('vue_ls', {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { 'node', vue_server_exec, '--stdio' },
      init_options = { vue = { hybridMode = true } },
      filetypes = { 'vue' },
      root_dir = vim.fs.root(0, { 'package.json', '.git' }),
    })

    -- 4. サーバーの有効化
    vim.lsp.enable { 'ts_ls', 'vue_ls', 'html', 'cssls', 'intelephense' }

    -- 5. Mason Tool Installer
    require('mason-tool-installer').setup {
      ensure_installed = {
        'stylua',
        'lua_ls',
        'intelephense',
        'css-lsp',
        'html-lsp',
        'typescript-language-server',
        'vue-language-server',
      },
    }

    -- 6. 他のサーバーの自動セットアップ
    local lspconfig = require 'lspconfig'
    require('mason-lspconfig').setup {
      handlers = {
        ['ts_ls'] = function() end,
        ['vue_ls'] = function() end,
        ['volar'] = function() end,
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end,
      },
    }

    -- 7. Neovim 0.11 のデフォルトを Telescope で強制上書きするオートコマンド
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local bufnr = event.buf

        -- ローカルな map 関数を定義（スコープの問題を解決）
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
        end

        -- 強力な 0.11 デフォルトキーを削除
        pcall(vim.keymap.del, 'n', 'grr', { buffer = bufnr })
        pcall(vim.keymap.del, 'n', 'gri', { buffer = bufnr })
        pcall(vim.keymap.del, 'n', 'grn', { buffer = bufnr }) -- renameも念のため

        -- キーバインドを再定義
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gk', function()
          vim.lsp.buf.hover { border = 'single', max_width = 80 }
        end, 'hover')
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

        -- Telescope 連携
        map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

        -- その他
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
        map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
      end,
    })
  end,
}
