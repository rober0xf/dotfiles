vim.api.nvim_set_hl(0, "Normal", { bg = "#161617" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#161617" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "none", bg = "none", bold = true })
vim.cmd("hi StatusLine guibg=none guifg=none")
vim.cmd("hi! LineNr guibg=none guifg=#444444")
vim.cmd("hi MsgArea guibg=none guifg=none")
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fb6107", bg = "NONE", bold = true })

-- mode
vim.api.nvim_set_hl(0, "SLNormal", { fg = "#161617", bg = "#ff5f00", bold = true })
vim.api.nvim_set_hl(0, "SLInsert", { fg = "#161617", bg = "#2fef10", bold = true })
vim.api.nvim_set_hl(0, "SLVisual", { fg = "#161617", bg = "#ffe302", bold = true })
vim.api.nvim_set_hl(0, "SLReplace", { fg = "#161617", bg = "#ff2400", bold = true })
vim.api.nvim_set_hl(0, "SLCommand", { fg = "#161617", bg = "#ff00cc", bold = true })

-- diagnostics
vim.api.nvim_set_hl(0, "SLDiagError", { fg = "#ff3131", bold = true })
vim.api.nvim_set_hl(0, "SLDiagWarn", { fg = "#ffd700", bold = true })
vim.api.nvim_set_hl(0, "SLDiagHint", { fg = "#00ffff", bold = true })
vim.api.nvim_set_hl(0, "SLDiagInfo", { fg = "#89cff0", bold = true })

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#fafa33", fg = "#161617" })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = "YankHighlight",
			timeout = 200,
		})
	end,
})

-- git
vim.api.nvim_set_hl(0, "SLGitAdd", { fg = "#00ff00", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "SLGitChange", { fg = "#ffac1c", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "SLGitRemove", { fg = "#ff0000", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#888888", bg = "none", italic = true })

-- diagnostics
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#0f52ba", bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff3131", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffd700", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#00ffff", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#89cff0", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = "#f44747", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "#ffd700", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#00ffff", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = "#89cff0", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#ff3131", bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#ffd700", bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#00ffff", bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#89cff0", bg = "none" })

-- tab
vim.api.nvim_set_hl(0, "TabLine", { fg = "#bbbbbb", bg = "none" })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#ffe100", bg = "none", bold = true })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#303030" })
