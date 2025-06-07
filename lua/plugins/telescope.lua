return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.7",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      local map = vim.keymap.set
      map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      map("n", "<leader>fw", builtin.grep_string, { desc = "Telescope find word" })
      map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope grep" })
      map("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope find diagnostics" })
      map("n", "<leader><leader>", builtin.buffers, { desc = "Telescope find existing buffers" })
      map("n", "<leader>cl", builtin.colorscheme, { desc = "Telescope colorscheme picker" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            },
          },
        },
      }

      require("telescope").load_extension("ui-select")
    end
  },
}
