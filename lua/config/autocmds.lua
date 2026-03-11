vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = "Adjusts the spacing for certain file types",
  group = vim.api.nvim_create_augroup("four-spacers", { clear = true }),
  pattern = { "solidity" },
  command = "set shiftwidth=4"
})
