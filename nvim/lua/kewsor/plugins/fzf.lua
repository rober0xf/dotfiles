return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({
            files = {
                cmd =
                "rg --files --glob '!*.log' --glob '!database/' --glob '!.git/' --glob '!node_modules/' --glob '!go.sum' --glob '!go.mod'",
                git_icons = false,
                file_icons = false
            },
            grep = {
                rg_opts =
                "--column --line-number -g '!*.log' -g '!database/' -g '!.git/' -g '!node_modules/' -g '!go.sum' -g '!go.mod'",
                no_esc = true
            }
        })

        vim.keymap.set("n", "<leader>pf", function()
            fzf.files()
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>pg", function()
            fzf.grep_curbuf()
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            print("searching the word: ", word)
            fzf.grep({ search = word })
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            fzf.grep({ search = word })
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>ps", function()
            fzf.grep({ search = vim.fn.input("Grep > ") })
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>pG", function()
            fzf.live_grep()
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>vh", function()
            fzf.help_tags()
        end, { noremap = true, silent = true })

        vim.keymap.set("n", "<leader>gs", function()
            fzf.git_status()
        end, { noremap = true, silent = true, desc = "Git FZF (S)tatus" })
    end

}
