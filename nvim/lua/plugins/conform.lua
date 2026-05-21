local opts = {
    formatters_by_ft = {
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        go = { "goimports", "gofmt" },
        yaml = { "prettier" },
        lua = { "stylua" },
        html = { "prettier" },
        css = { "prettier" },
        python = { "ruff", "ruff_imports" },
    },

    formatters = {
        ruff = {
            command = "ruff",
            args = {
                "format",
                "--config",
                vim.fn.expand("~/.config/ruff/ruff.toml"),
                "-",
            },
            stdin = true,
        },

        ruff_imports = {
            command = "ruff",
            args = {
                "check",
                "--select",
                "I",
                "--fix",
                "--config",
                vim.fn.expand("~/.config/ruff/ruff.toml"),
                "-",
            },
            stdin = true,
        },
    },
}
require("conform").setup(opts)

local function format(options)
    require("conform").format({
        lsp_fallback = true,
        async = true,
        timeout_ms = options and options.timeout_ms or 1000,
    })
end

vim.keymap.set("n", "<leader>f", function()
    format()
end, { desc = "format buffer" })
