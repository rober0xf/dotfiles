vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "format file" })

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, { desc = "info about the method" })

vim.keymap.set("n", "A", "0", { desc = "go to the beggining of the line" })
vim.keymap.set("n", "L", "$", { desc = "go to the end of the line" })


vim.keymap.set("v", "<leader>y", "\"+y", { desc = "copy the text selected" })
vim.keymap.set("n", "<leader>Y", "\"+yy", { desc = "copy the whole line" })
vim.keymap.set("n", "p", "\"+p", { desc = "paste from the clipboard" })

vim.keymap.set("v", "A", "gg", { desc = "go to the beginning of the file in v mode" })

vim.keymap.set("v", "<leader>l", "$", { desc = "go to the end of the line in v mode" })
vim.keymap.set("v", "<leader>a", "0", { desc = "go to the beggining of the line in v mode" })

vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "next diagnostic" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })
vim.keymap.set("n", "<leader>dw", vim.diagnostic.open_float, { desc = "diagnostics window" })

vim.keymap.set("n", "<leader>sd", ":m .+1<CR>", { desc = "move current line down" })
vim.keymap.set("n", "<leader>su", ":m .-2<CR>", { desc = "move current line up" })

vim.keymap.set("n", "<leader>u", "u", { desc = "undo" })
vim.keymap.set("n", "<leader>r", "<C-r>", { desc = "redo" })

vim.keymap.set("n", "<leader>b", "<C-^", { noremap = true, silent = true, desc = "previous file" })
