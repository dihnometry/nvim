local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Save and Quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- This is weird, but ergonomic
map("n", "<CR>", "ciw", opts)

-- Move text up and down
map("x", "J", ":move '>+1<CR>gv=gv", opts)
map("x", "K", ":move '<-2<CR>gv=gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)
