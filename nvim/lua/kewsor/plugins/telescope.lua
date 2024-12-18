return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require("telescope").setup({})
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", function()
            builtin.find_files({
                hidden = true,
                file_ignore_patterns = { "*.log", "database/", ".git/", "node_modules/" }
            })
        end)

        -- search for a word in the current file
        vim.keymap.set("n", "<leader>pg", function()
            builtin.current_buffer_fuzzy_find()
        end, { noremap = true, silent = true })

        -- search for a word from the beggining
        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            print("searching the word: ", word)
            builtin.grep_string({ search = word })
        end
        )

        -- search for the whole line
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end
        )

        -- search for a word
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        -- search for a word in the whole project
        vim.keymap.set("n", "<leader>pG", function()
            builtin.live_grep()
        end)

        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    end
}
