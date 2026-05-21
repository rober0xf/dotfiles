require("gitsigns").setup({
    current_line_blame = true,
    signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "-" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

-- apply once for current session
vim.api.nvim_set_hl(0, "SLGitAdd", { fg = "#5f875f", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "SLGitChange", { fg = "#af875f", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "SLGitRemove", { fg = "#af5f5f", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#888888", bg = "none", italic = true })
