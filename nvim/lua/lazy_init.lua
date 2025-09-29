require("config.remap")
require("config.set")
require("config.statusline")

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

require("lazy").setup({
    require("plugins.treesitter"),
    require("plugins.undotree"),
    require("plugins.fzf"),
    require("plugins.gitsigns"),
    require("plugins.none-ls"),
    require("plugins.conform"),
    require("plugins.yazi"),
    require("plugins.harpoon"),
    require("plugins.lsp"),
    require("config.colorscheme")
})
