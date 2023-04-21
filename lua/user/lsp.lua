local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
    return
end

lsp.preset("recommended")

lsp.ensure_installed({
    "lua_ls",
    "rust_analyzer",
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm(cmp_select),
    ["<C-Space>"] = cmp.mapping.complete(cmp_select),
})

lsp.on_attach(function (client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local keymaps = vim.keymap.set

    keymaps("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymaps("n", "K", function() vim.lsp.buf.hover() end, opts)
    keymaps("n", "<leader>vd", function() vim.lsp.diagnostic.open_float() end, opts)
    keymaps("n", "<leader>d", function() vim.diagnostic.goto_next() end, opts)
    keymaps("n", "<leader>D", function() vim.diagnostic.goto_prev() end, opts)
    keymaps("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    keymaps("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    keymaps("i", "<C-j>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
