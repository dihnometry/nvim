return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      { "j-hui/fidget.nvim", opts = {}, },
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          local builtin = require("telescope.builtin")
          -- Jump to definition
          map("gd", builtin.lsp_definitions, "Go to definition")
          -- Find references
          map("gr", builtin.lsp_references, "Find references")
          -- Go to implementation
          map("gI", builtin.lsp_implementations, "Go to implementation")
          -- Document symbols
          map("<leader>ds", builtin.lsp_document_symbols, "Document symbols")
          -- Rename variable under cursor
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          -- Code action
          map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
        end
      })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        lua_ls = {},
        clangd = {},
        rust_analyzer = {},
        ts_ls = {},
      }

      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilites or {})
            require("lspconfig")[server_name].setup(server)
          end
        },
      })
    end,
  },
}
