vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/ThePrimeagen/harpoon",               branch = "harpoon2" },
    { src = "https://github.com/mikavilpas/yazi.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-cmdline" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/nvimtools/none-ls.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/j-hui/fidget.nvim" }
})

local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugins")

table.sort(files)
for _, file in ipairs(files) do
    if file:match("%.lua$") and file ~= "init.lua" then
        require("plugins." .. file:gsub("%.lua$", ""))
    end
end
