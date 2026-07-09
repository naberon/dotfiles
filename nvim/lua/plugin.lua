-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
vim.opt.rtp:prepend(lazypath)

local neovim_plugins = {
  -- Detect tabstop and shiftwidth automatically
  --'NMAC427/guess-indent.nvim',

  require 'plugins.gitsigns',

  require 'plugins.which-key',

  require 'plugins.telescope',

  require 'plugins.lazydev',

  require 'plugins.nvim-lspconfig',

  require 'plugins.trouble',

  require 'plugins.conform',

  require 'plugins.blink_cmp',

  -- require 'plugins.tokyonight',
  require 'plugins.catppuccin',

  -- status bar
  require 'plugins.lualine',

  -- nvim-surround
  require 'plugins.nvim-surround',

  -- Highlight todo, notes, etc in comments
  require 'plugins.todo-comments',

  -- Highlight, edit, and navigate code
  require 'plugins.nvim-treesitter',

  require 'plugins.mini',

  require 'plugins.autoread',

  -- File explorer
  require 'plugins.oil',
  require 'plugins.nvim-tree',

  -- Git diff viewer
  require 'plugins.diffview',
  require 'plugins.git-conflict',

  -- UI enhancement
  require 'plugins.noice',

  -- LSP UI
  require 'plugins.lspsaga',

  -- Diagnostics
  require 'plugins.tiny-inline-diagnostic',
  require 'plugins.diagflow',
  require 'plugins.lsp_lines',

  -- Terminal
  require 'plugins.toggleterm',

  -- Comment
  require 'plugins.comment',

  -- Emmet
  require 'plugins.emmet',

  -- Color highlight
  require 'plugins.nvim-highlight-colors',

  -- Motion
  require 'plugins.flash',
}

local lazy_ui = {
  -- If you are using a Nerd Font: set icons to an empty table which will use the
  -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
  icons = vim.g.have_nerd_font and {} or {
    cmd = '⌘',
    config = '🛠',
    event = '📅',
    ft = '📂',
    init = '⚙',
    keys = '🗝',
    plugin = '🔌',
    runtime = '💻',
    require = '🌙',
    source = '📄',
    start = '🚀',
    task = '📌',
    lazy = '💤 ',
  },
}
require('lazy').setup(neovim_plugins, lazy_ui)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
