return {
  'mattn/emmet-vim',
  ft = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
  init = function()
    vim.g.user_emmet_leader_key = '<C-y>'
  end,
}
