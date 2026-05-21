vim.cmd("packadd nvim-treesitter")
require("nvim-treesitter.config").setup({
    ensure_installed = { "go", "gomod", "gowork", "gosum", "typescript", "python", "lua" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = false,
    }
})
