return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                auto_start = true,
                keymaps = {
                    accept_suggestion = "<C-->",
                    dismiss_suggestion = "<C-]>",
                }
            })
        end
    }
}
