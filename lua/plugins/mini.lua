return {
  'echasnovski/mini.nvim',
  version = false,
  config = function ()
    local map = vim.keymap.set
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.files").setup()

    map("n", "<leader>e", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true})
  end
}

