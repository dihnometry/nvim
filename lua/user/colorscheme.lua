local colorscheme = "rose-pine"

-- require("onedark").setup({
--     transparent = true,
--     lualine = {
--         transparent = false,
--     }
-- })

require("rose-pine").setup({
    variant = 'moon',
    disable_background = true,
    -- disable_float_background = true,
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Colorscheme " .. colorscheme .. " not found.")
    return
end


-- Uncomment if want transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
