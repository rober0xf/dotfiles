return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "nvim-lua/plenary.nvim",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "jose-elias-alvarez/null-ls.nvim",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd", "gopls", "lua_ls", "rust_analyzer"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
            },
        })
        local rust = require("lspconfig")
        rust.rust_analyzer.setup({
            cmd = { "/home/kewsor/.cargo/bin/rust-analyzer" },
            settings = {
                ['rust-analyzer'] = {
                    checkOnSave = {
                        command = 'clippy',
                    },
                    diagnostics = {
                        enable = true,
                    },
                }
            },
        })

        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.clang_format,
            },
        })
        local cmp_nvim_lsp = require "cmp_nvim_lsp"
        require("lspconfig").clangd.setup {
            --on_attach = on_attach,
            capabilities = cmp_nvim_lsp.default_capabilities(),
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
            },
        }

        -- remove "undefined global viariable vim" warning
        local lua_ls = require("lspconfig")
        lua_ls.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    }
                }
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<A-a>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),

            sources = cmp.config.sources({
                -- primary data source
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                -- secondary data source
                { name = "buffer" },
                { name = "path" },
            })
        })

        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = true,
                style = "rounded",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "-",
                max_width = 100,
                max_height = 100,
            },
        })
    end
}
