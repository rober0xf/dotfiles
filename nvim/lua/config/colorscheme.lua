return {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        bold = true,
        italic = {
            strings = true,
        }
    },
    config = function()
        vim.cmd.colorscheme("gruber-darker")
    end,
}
