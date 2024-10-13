return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = { "lua", "vim", "vimdoc", "c", "rust", "python", "markdown", "markdown_inline" },
    auto_install = true,
  },
}
