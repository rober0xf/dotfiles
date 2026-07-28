vim.pack.add({
    {
        src = "https://github.com/mofiqul/vscode.nvim",
        name = "vscode",
    }
})

vim.o.background = 'dark'
vim.cmd.colorscheme("vscode")

vim.api.nvim_set_hl(0, "Exception", {
    underline = false,
    undercurl = false,
})
