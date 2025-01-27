vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = function(mode, lhs, rhs, opts)
    opts = opts or { noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>f", vim.lsp.buf.format, { desc = "format file" })

map("n", "<leader>gr", vim.lsp.buf.references)
map("n", "<leader>gd", vim.lsp.buf.definition)
map("n", "<leader>i", vim.lsp.buf.hover, { desc = "info about the method" })

map("n", "A", "0", { desc = "go to the beggining of the line" })
map("n", "L", "$", { desc = "go to the end of the line" })

map("v", "L", "$", { desc = "go to the end of the line in v mode" })
map("v", "A", "^", { desc = "go to the beggining of the line in v mode" })

map("v", "y", "\"+y", { desc = "copy the text selected" })
map("v", "Y", "\"+yy", { desc = "copy the whole line" })

map("n", "p", "\"+p", { desc = "paste from the clipboard" })

map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "next diagnostic" })
map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })
map("n", "<leader>dw", vim.diagnostic.open_float, { desc = "diagnostics window" })

map("n", "J", ":m .+1<CR>", { desc = "move current line down" })
map("n", "K", ":m .-2<CR>", { desc = "move current line up" })

map('v', 'J', ':m .+1<CR>gv=gv', { noremap = true, silent = true, desc = 'select the current line and move it down' })
map('v', 'K', ':m .-2<CR>gv=gv', { noremap = true, silent = true, desc = 'select the current line and move it up' })

map("n", "<leader>u", "u", { desc = "undo" })
map("n", "<leader>r", "<C-r>", { desc = "redo" })

map('n', '<C-p>', '<C-^>', { noremap = true, silent = true, desc = 'previous file' })
map("v", "g c", "<Plug>Commentary", { noremap = true, silent = true, desc = "comment the current line" })

map("n", "}", ":noh<CR>", { noremap = true, silent = true, desc = "remove the search highlight" })
