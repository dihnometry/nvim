local web_front = vim.api.nvim_create_augroup("web_front_end", { clear = true })
local texters = vim.api.nvim_create_augroup("texters", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal shiftwidth=2",
    group = web_front,
    pattern = { "html", "css" }
})

vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal wrap spell spelllang=es",
    group = texters,
    pattern = { "tex", "latex", "markdown", "plaintex" }
})

vim.api.nvim_create_autocmd("FileType", {
    command = "setlocal shiftwidth=2",
    pattern ={ "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" }
})
