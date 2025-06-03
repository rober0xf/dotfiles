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
        "nvimtools/none-ls.nvim"
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
                "clangd", "gopls", "lua_ls", "pylsp", "rust_analyzer"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
            },
        })
        local null_ls = require("null-ls")
        local sources = {
            null_ls.builtins.formatting.clang_format,
            null_ls.builtins.formatting.black,
        }
        null_ls.setup({
            sources = sources
        })

        local cmp_nvim_lsp = require "cmp_nvim_lsp"
        require("lspconfig").clangd.setup {
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
        local rust = require("lspconfig")
        rust.rust_analyzer.setup({
            cmd = { "/home/rober/.cargo/bin/rust-analyzer" },
            settings = {
                ['rust-analyzer'] = {
                    check = {
                        command = 'clippy',
                    },
                    diagnostics = {
                        enable = true,
                    },
                }
            },
        })
        require("lspconfig").pylsp.setup({
            settings = {
                pylsp = {
                    plugins = {
                        flake8 = { enabled = true },
                        black = { enabled = true },
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
            virtual_text = true,
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
