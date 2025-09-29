return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            current_line_blame = true,
            signs = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "-" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            }
        })

        -- colors
        vim.cmd [[
            highlight GitSignsAdd    guifg=#00ff00 guibg=NONE gui=bold
            highlight GitSignsChange guifg=#ffac1c guibg=NONE gui=bold
            highlight GitSignsDelete guifg=#ff0000 guibg=NONE gui=bold
        ]]
    end
}
