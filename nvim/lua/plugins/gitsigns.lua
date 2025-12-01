return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "-" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		})

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00", bg = "none", bold = true })
				vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffac1c", bg = "none", bold = true })
				vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000", bg = "none", bold = true })
				vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#888888", bg = "none", italic = true })
			end,
		})

		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#00ff00", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ffac1c", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#ff0000", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#888888", bg = "none", italic = true })
	end,
}
