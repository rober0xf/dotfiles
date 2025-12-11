return {
    "ibhagwan/fzf-lua",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({
            files = {
                cmd =
                    "rg --files"
                    .. " --glob '!*.log'"
                    .. " --glob '!database/'"
                    .. " --glob '!.git/'"
                    .. " --glob '!node_modules/'"
                    .. " --glob '!go.sum'"
                    .. " --glob '!go.mod'"
                    .. " --glob '!package.json'"
                    .. " --glob '!package-lock.json'"
                    .. " --glob '!frontend'",
                git_icons = true,
                winopts = {
                    height = 0.8,
                    width = 0.8,
                    row = 0.3,
                    col = 0.5,
                    border = "none",
                    preview = {
                        hidden = "nohidden",
                        layout = "horizontal",
                        vertical = "up:50%",
                    }
                }
            },
            grep = {
                rg_opts =
                    "--column --line-number"
                    .. " -g '!*.log'"
                    .. " -g '!database/'"
                    .. " -g '!.git/'"
                    .. " -g '!node_modules/'"
                    .. " -g '!go.sum'"
                    .. " -g '!go.mod'"
                    .. " -g '!package.json'"
                    .. " -g '!package-lock.json'",
                no_esc = true
            },
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

        vim.keymap.set("n", "<leader>dw", function()
            require("fzf-lua").diagnostics_workspace()
        end, { desc = "Diagnostics del workspace" })

        vim.keymap.set("n", "<leader>db", function()
            require("fzf-lua").diagnostics_document()
        end, { desc = "Diagnostics del buffer" })
    end

}
