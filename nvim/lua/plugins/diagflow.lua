return {
  'dgagn/diagflow.nvim',
  event = 'LspAttach',
  config = function()
    require('diagflow').setup {}
  end,
}
