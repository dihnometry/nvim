vim.cmd([[
  augroup _html
    autocmd!
    autocmd FileType html setlocal shiftwidth=2
  augroup end

  augroup _css
    autocmd!
    autocmd FileType html setlocal shiftwidth=2
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap spell
  augroup end
]])
