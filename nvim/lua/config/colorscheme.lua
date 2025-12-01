return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    init = function()
        vim.g.sonokai_style = "maia"
        vim.g.sonokai_bold = 1
        vim.g.sonokai_italic = 1
        vim.g.sonokai_italic_strings = 0
    end,
    config = function()
        vim.cmd.colorscheme("sonokai")
        local colors_path = vim.fn.stdpath("config") .. "/lua/config/colors.lua"
        local ok = pcall(dofile, colors_path)
        if not ok then
            vim.notify("colors.lua not found, skipping overrides")
        end
    end,
}
