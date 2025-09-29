return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                typescript = { "prettier" },
                go = { "goimports", "gofmt" },
                yaml = { "prettier" },
                lua = { "stylua" },
            },
            formatters = {
                prettier = {
                    command = "prettier",
                    filetype_args = {
                        typescript = {
                            "--single-quote",
                            "--jsx-single-quote",
                            "--trailing-comma=es5",
                            "--semi=true",
                            "--tab-width=4",
                            "--print-width=190",
                            "--parser=typescript"
                        },
                    }
                },
            },
        },
        config = function(_, opts)
            require("conform").setup(opts)
            vim.lsp.buf.format = function(options)
                require("conform").format({
                    lsp_fallback = true,
                    timeout_ms = options and options.timeout_ms or 1000,
                })
            end
        end,
    }
}
