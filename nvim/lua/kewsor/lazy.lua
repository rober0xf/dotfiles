require("kewsor.remap")
require("kewsor.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
vim.g.python3_host_prog = '/home/kewsor/binaries/env/bin/python3'

require("lazy").setup({
    require("kewsor.plugins.treesitter"),
    require("kewsor.plugins.colorscheme"),
    require("kewsor.plugins.lsp"),
    require("kewsor.plugins.undotree"),
    require("kewsor.plugins.fidget"),
    require("kewsor.plugins.fzf"),
    require("kewsor.plugins.lualine"),
    require("kewsor.plugins.supermaven"),
})
