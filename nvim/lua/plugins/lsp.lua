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
                "gopls", "lua_ls", "ts_ls", "rust_analyzer"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
            },
        })

        -- remove "undefined global viariable vim" warning
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    }
                }
            }
        })

        -- typescript --
        vim.lsp.config("ts_ls", {
            cmd = { "typescript-language-server", "--stdio" },
            capabilities = capabilities,
            root_dir = vim.fs.root(0, { "tsconfig.json", "package.json", ".git" }),
            filetypes = { "typescript" },
            settings = {
                typescript = {
                    format = {
                        enable = true,
                    },
                },
                workspace = {
                    didChangeWatchedFiles = {
                        dynamicRegistration = true,
                    },
                },
            },
        })
        -- end --

        -- rust --
        vim.lsp.config("rust-analyzer", {
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
        -- end --

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
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
            })
        })

        vim.diagnostic.config({
            update_in_insert = true,
            virtual_text = true,
            float = {
                focusable = true,
                style = "rounded",
                border = "single",
                source = "always",
                header = "",
                prefix = "-",
                max_width = 100,
                max_height = 100,
            },
        })
    end
}
