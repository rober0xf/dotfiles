vim.opt.guicursor = table.concat({
    "n-v-c:block-blinkwait700-blinkon400-blinkoff250",
    "i-ci:ver25-blinkwait700-blinkon400-blinkoff250",
    "r-cr:hor20-blinkwait700-blinkon400-blinkoff250"
}, ",")

vim.defer_fn(function()
    -- numbers, current line
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282828" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffe100", bg = "NONE", bold = true })

    -- diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff3131", bg = "#181818", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffd700", bg = "#181818", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#00ffff", bg = "#181818", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#89cff0", bg = "#181818", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = "#f44747", bg = "#181818", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "#ffd700", bg = "#181818", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#00ffff", bg = "#181818", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = "#89cff0", bg = "#181818", bold = true })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181818" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffe100", bg = "#181818" })

    -- tab
    vim.api.nvim_set_hl(0, "TabLine", { fg = "#bbbbbb", bg = "#181818" })
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffe100", bg = "#303030", bold = true })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#181818" })
end, 100)

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.smartindent = true

-- looks
vim.opt.termguicolors = true
vim.opt.wrap = true
vim.opt.nu = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"

-- info files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- hightlight when searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- views
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 100
vim.opt.colorcolumn = "0"

-- vim.opt.clipboard = 'unnamedplus'

-- remove the comment after line break
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- hightlight when copy
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#fafa33", fg = "#000000" })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = "YankHighlight",
            timeout = 200,
        })
    end,
})
