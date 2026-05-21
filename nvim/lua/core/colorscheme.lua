vim.pack.add({
    {
        src = "https://github.com/nickkadutskyi/jb.nvim",
        name = "jb",
    }
})

require("jb").setup()
vim.cmd.colorscheme("jb")

vim.api.nvim_set_hl(0, "Exception", {
    underline = false,
    undercurl = false,
})
