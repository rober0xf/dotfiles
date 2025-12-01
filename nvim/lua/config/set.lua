vim.opt.guicursor = table.concat({
    "n-v-c:block-blinkwait700-blinkon400-blinkoff250",
    "i-ci:ver25-blinkwait700-blinkon400-blinkoff250",
    "r-cr:hor20-blinkwait700-blinkon400-blinkoff250"
}, ",")

vim.defer_fn(function()

end, 100)

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.smartindent = true

-- looks
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

-- remove the comment after line break
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})
