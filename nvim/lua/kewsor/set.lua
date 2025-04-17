vim.opt.guicursor = ""
vim.opt.nu = true

vim.opt.guicursor = "a:blinkon1"

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.defer_fn(function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d65d0e", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff0000", bg = "#181616", bold = true })

    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffcc00", bg = "#181616", bold = true }) -- Warnings (W)
    vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#00ffaa", bg = "#181616", bold = true }) -- Hints (H)
    vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#00aaff", bg = "#181616", bold = true }) -- Info (I)
end, 100)


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "0"
vim.opt.clipboard = 'unnamedplus'
