return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "jose-elias-alvarez/null-ls.nvim",
        "pmizio/typescript-tools.nvim",
    },


    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())
        vim.g.python3_host_prog = '/home/kewsor/binaries/env/bin/python3'


        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "volar", "clangd", "gopls", "lua_ls", "tailwindcss",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["volar"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.volar.setup {
                        capabilities = capabilities,
                    }
                end,
            }
        })
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "typescript", "typescriptreact", "vue" },
                    extra_args = { "--config-precedence", "prefer-file" },
                }),
            },
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
                { name = "nvim_lsp" },
                { name = "luasnip" }
            }, {
                { name = "buffer" },
            })
        })
        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "rounded",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "➤",
                max_width = 100,
                max_height = 100,
            },
        })
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "next diagnostic" })
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })
        vim.keymap.set("n", "<leader>dw", vim.diagnostic.open_float, { desc = "diagnostics window" })
    end
}
