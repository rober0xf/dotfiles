return {
    {
        "blazkowolf/gruber-darker.nvim",
        --"Abstract-IDE/Abstract-cs",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruber-darker")
            --vim.cmd("colorscheme abscs")
        end
    },
}
