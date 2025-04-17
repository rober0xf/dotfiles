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

        vim.cmd [[
             highlight GitSignsAdd    guifg=#00ff00 guibg=NONE gui=bold
            highlight GitSignsChange guifg=#ffcc00 guibg=NONE gui=bold
            highlight GitSignsDelete guifg=#ff0000 guibg=NONE gui=bold
        ]]
        vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})

        vim.keymap.set("n", "<leader>gS", ":Gitsigns stage_hunk<CR>", {})
        vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", {})
    end
}
