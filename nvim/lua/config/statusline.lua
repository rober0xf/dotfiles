-- mode
vim.api.nvim_set_hl(0, "SLNormal", { fg = "#181818", bg = "#ffd700", bold = true })
vim.api.nvim_set_hl(0, "SLInsert", { fg = "#181818", bg = "#32cd32", bold = true })
vim.api.nvim_set_hl(0, "SLVisual", { fg = "#181818", bg = "#ff7518", bold = true })
vim.api.nvim_set_hl(0, "SLReplace", { fg = "#181818", bg = "#ff2400", bold = true })
vim.api.nvim_set_hl(0, "SLCommand", { fg = "#000000", bg = "#ff69b4", bold = true })

-- git
vim.api.nvim_set_hl(0, "SLGitAdd", { fg = "#00ff00", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "SLGitChange", { fg = "#ffac1c", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "SLGitRemove", { fg = "#ff0000", bg = "NONE", bold = true })

-- diagnostics
vim.api.nvim_set_hl(0, "SLDiagError", { fg = "#ff3131", bold = true })
vim.api.nvim_set_hl(0, "SLDiagWarn", { fg = "#ffd700", bold = true })
vim.api.nvim_set_hl(0, "SLDiagHint", { fg = "#00ffff", bold = true })
vim.api.nvim_set_hl(0, "SLDiagInfo", { fg = "#89cff0", bold = true })

-- set mode colors
local function mode()
    local m = vim.fn.mode()
    local modes = {
        n     = { "NORMAL", "%#SLNormal#" },
        i     = { "INSERT", "%#SLInsert#" },
        v     = { "VISUAL", "%#SLVisual#" },
        V     = { "V-LINE", "%#SLVisual#" },
        [""] = { "V-BLOCK", "%#SLVisual#" },
        R     = { "REPLACE", "%#SLReplace#" },
        c     = { "COMMAND", "%#SLCommand#" },
    }
    local current = modes[m]
    if current then
        return current[2] .. " " .. current[1] .. " %#StatusLine#"
    else
        return "%#StatusLine#" .. " " .. m .. " "
    end
end

-- git functions
local function git_branch()
    local branch = vim.b.gitsigns_head
    return branch and (" " .. branch) or ""
end

local function git_diff()
    local gitsigns = vim.b.gitsigns_status_dict
    if not gitsigns then return "" end

    local parts = {}

    if gitsigns.added and gitsigns.added > 0 then
        table.insert(parts, "%#SLGitAdd#+" .. gitsigns.added .. "%#StatusLine#")
    end
    if gitsigns.changed and gitsigns.changed > 0 then
        table.insert(parts, "%#SLGitChange#~" .. gitsigns.changed .. "%#StatusLine#")
    end
    if gitsigns.removed and gitsigns.removed > 0 then
        table.insert(parts, "%#SLGitRemove#-" .. gitsigns.removed .. "%#StatusLine#")
    end

    return table.concat(parts, " ")
end

local function diagnostics()
    local counts = {
        errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }),
        warns  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }),
        infos  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }),
        hints  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT }),
    }
    local result = {}

    if counts.errors > 0 then
        table.insert(result, "%#SLDiagError#E:" .. counts.errors .. "%#StatusLine#")
    end
    if counts.warns > 0 then
        table.insert(result, "%#SLDiagWarn#W:" .. counts.warns .. "%#StatusLine#")
    end
    if counts.infos > 0 then
        table.insert(result, "%#SLDiagInfo#I:" .. counts.infos .. "%#StatusLine#")
    end
    if counts.hints > 0 then
        table.insert(result, "%#SLDiagHint#H:" .. counts.hints .. "%#StatusLine#")
    end

    return table.concat(result, " ")
end


local function os_name()
    local sysname = vim.loop.os_uname().sysname
    if sysname == "Linux" or sysname == "Darwin" then
        return "unix"
    end
    return sysname
end

function Statusline()
    return table.concat({
        "%#StatusLine#",
        " ", mode(),
        " :: %m",
        "%t",
        " :: ", git_branch(), " ", git_diff(), " ", diagnostics(),
        "%=",
        os_name(), " :: %y",
        " :: %p%%",
    })
end

vim.o.laststatus = 3 -- global statusline
vim.o.statusline = "%!v:lua.Statusline()"
