vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- map easier
local map = function(mode, lhs, rhs, opts)
	opts = opts or { noremap = true, silent = true }
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- format
map("n", "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_fallback = true,
		-- timeout_ms = 1000,
	})
end, { desc = "format file" })

-- references
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "see references" })
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to definition" })
map("n", "<leader>i", vim.lsp.buf.hover, { desc = "info about the method" })

-- move quick
map("n", "A", "^", { desc = "go to the beggining of the line" })
map("n", "L", "g_", { desc = "go to the end of the line" })
map("v", "L", "g_", { desc = "go to the end of the line in v mode" })
map("v", "A", "^", { desc = "go to the beggining of the line in v mode" })

-- copy
map("n", "Y", "yy", { desc = "copy the whole line to the buffers" })
map("v", "y", '"+y', { desc = "copy the text selected" })

-- paste
map("n", "p", "p", { desc = "paste from the buffers" })
map("n", "P", '"+p', { desc = "paste from the clipboard" })

-- diagnostics
map("n", "<leader>w", vim.diagnostic.open_float, { desc = "diagnostics window" })
map("n", "<leader>+", vim.diagnostic.goto_next, { desc = "go to next diagnostic" })
map("n", "<leader>-", vim.diagnostic.goto_prev, { desc = "go to previous diagnostic" })

-- move lines
map("n", "K", ":m .-2<CR>==", { desc = "move current line up" })
map("n", "J", ":m .+1<CR>==", { desc = "move current line down" })
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "select the current line and move it down" })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "select the current line and move it up" })

-- undo redo
map("n", "<leader>u", "u", { desc = "undo" })
map("n", "<leader>r", "<C-r>", { desc = "redo" })

-- prev and next file
map("n", "<C-p>", "<C-^>", { noremap = true, silent = true, desc = "previous file" })
map("n", "<C-n>", ":bnext<CR>", { noremap = true, silent = true, desc = "next file" })

-- comment
map("v", "g c", "<Plug>Commentary", { noremap = true, silent = true, desc = "comment the current line" })

-- remove the highlights
map("n", "}", ":noh<CR>", { noremap = true, silent = true, desc = "remove the search highlight" })

map("n", "x", '"_x')
map("n", "d", '"_d')

-- select current word
map("n", "Q", "viw", { noremap = true, silent = true })

-- tabs
map("n", "<leader><Right>", ":tabnext<CR>", { noremap = true, silent = true })
map("n", "<leader><Left>", ":tabprevious<CR>", { noremap = true, silent = true })

-- buffers in a tab
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
map("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
map("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })

-- git
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
map("n", "<leader>gS", ":Gitsigns stage_hunk<CR>", {})
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", {})

-- copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<A-l>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
