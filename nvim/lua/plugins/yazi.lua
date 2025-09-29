return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        -- 👇 in this section, choose your own keymappings!
        {
            "<leader>x",
            mode = { "n", "v" },
            "<cmd>Yazi<cr>",
            desc = "open at the current file",
        },
        {
            -- Open in the current working directory
            "<leader>X",
            "<cmd>Yazi cwd<cr>",
            desc = "Open in the working directory",
        },
        {
            "<c-up>",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
    },
}
