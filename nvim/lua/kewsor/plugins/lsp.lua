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
        "supermaven-inc/supermaven-nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
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
                "clangd", "gopls", "lua_ls", "pylsp"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
            },
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                "mypy", "pylsp",
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

        -- path to the python environment
        vim.g.python3_host_prog = '/home/kewsor/binaries/env/bin/python3'
        require("lspconfig").pylsp.setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            settings = {
                python = {
                    pythonPath = vim.g.python3_host_prog
                }
            }
        })

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
                ["<C-->"] = function(fallback)
                    local supermaven = require("supermaven-nvim")
                    if supermaven and supermaven.accept_suggestion then
                        supermaven.accept_suggestion()
                    else
                        fallback()
                    end
                end,
            }),

            sources = cmp.config.sources({
                -- primary data source
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "supermaven" },
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
