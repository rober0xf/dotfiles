return {
    {
        "NLKNguyen/papercolor-theme",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.PaperColor_Theme_Options = {
                theme = {
                    default = {
                        allow_bold = 1,
                        allow_italic = 1,
                    },
                },
            }

            vim.o.background = "dark"
            vim.opt.termguicolors = true
            vim.cmd.colorscheme("PaperColor")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.opt.fillchars = { eob = " " }
        end
    },
}
