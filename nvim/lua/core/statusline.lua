local function mode()
    local m = vim.fn.mode()
    local names = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "V-LINE",
        [""] = "V-BLOCK",
        R = "REPLACE",
        c = "COMMAND",
    }
    return names[m] or m
end

-- git functions
local function git_branch()
    return vim.b.gitsigns_head and (" " .. vim.b.gitsigns_head) or ""
end

local function git_diff()
    local g = vim.b.gitsigns_status_dict
    if not g then return "" end

    local parts = {}
    if (g.added or 0) > 0 then parts[#parts + 1] = "+" .. g.added end
    if (g.changed or 0) > 0 then parts[#parts + 1] = "~" .. g.changed end
    if (g.removed or 0) > 0 then parts[#parts + 1] = "-" .. g.removed end

    return table.concat(parts, " ")
end

local function diagnostics()
    local s = vim.diagnostic.severity
    local counts = {
        E = #vim.diagnostic.get(0, { severity = s.ERROR }),
        W = #vim.diagnostic.get(0, { severity = s.WARN }),
        I = #vim.diagnostic.get(0, { severity = s.INFO }),
        H = #vim.diagnostic.get(0, { severity = s.HINT }),
    }

    local parts = {}
    for k, v in pairs(counts) do
        if v > 0 then
            parts[#parts + 1] = k .. ":" .. v
        end
    end

    return table.concat(parts, " ")
end

local function os_name()
    local name = vim.loop.os_uname().sysname
    return (name == "Linux" or name == "Darwin") and "unix" or name
end

local function lsp_name()
    local client = vim.lsp.get_clients({ bufnr = 0 })[1]
    return client and client.name or "no-lsp"
end

function Statusline()
    return table.concat({
        mode(),
        ":: %m%t",
        ":: ", git_branch(), " ", git_diff(), " ", diagnostics(),
        "%=",
        lsp_name(),
        ":: ", os_name(), " :: %y",
        ":: %p%%",
    }, " ")
end

vim.o.laststatus = 3 -- global statusline
vim.o.statusline = "%!v:lua.Statusline()"
