local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")

local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
)

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",
        "vtsls",
        "lua_ls",
        "basedpyright"
    },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
            })
        end,
    },
})

-- lua
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})
-- end lua --

-- typescript
vim.lsp.config("vtsls", {
    cmd = { "vtsls", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_markers = {
        "package-lock.json",
        "tsconfig.json",
        "jsconfig.json",
        "bun.lockb",
        "bun.lock",
        ".git",
    },
    settings = {
        vtsls = {
            tsserver = {},
        },
    },
})
-- end typescript --

-- python
vim.lsp.config("basedpyright", {
    settings = {
        basedpyright = {
            disableOrganizeImports = true,
            analysis = {
                autoImportCompletions = false,
                typeCheckingMode = "standard",
            },
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("python_lsp_capabilities", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
        end

        if client.name == "ruff" or client.name == "basedpyright" then
            client.server_capabilities.documentFormattingProvider = false
        end
    end,
})

vim.lsp.config("ruff", {
    init_options = {
        settings = {
            args = {
                "--config",
                vim.fn.expand("~/.config/ruff/ruff.toml"),
                "--fix",
            },
        },
    },
})

vim.lsp.enable("ruff")
-- end python --

-- cmp
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
    }),
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
