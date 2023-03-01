require('rose-pine').setup({
    disable_background = true,
    dark_variant = 'moon',
})
require 'colorizer'.setup()
require 'nvim-web-devicons'.setup { }

function SetColor(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- vim.api.nvim_set_hl(0, "CursorLine", { })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "Orange", bold = true })
end

SetColor()
