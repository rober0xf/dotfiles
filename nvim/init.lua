require("kewsor.lazy")
require("kewsor.set")
require("kewsor.remap")

-- background of line number
vim.cmd('hi! LineNr guibg=none ctermbg=none')


function Find_and_use_venv()
    local venv_paths = {
        vim.fn.getcwd() .. "/.venv",
        vim.fn.getcwd() .. "/venv",
        vim.fn.getcwd() .. "/env",
        vim.fn.getcwd() .. "/.env"
    }

    for _, venv_path in ipairs(venv_paths) do
        local python_path = venv_path .. "/bin/python"
        if vim.fn.executable(python_path) == 1 then
            -- Found a valid virtualenv
            vim.g.python3_host_prog = python_path
            vim.env.VIRTUAL_ENV = venv_path
            vim.env.PATH = venv_path .. "/bin:" .. vim.env.PATH
            print("using the venv: " .. venv_path)
            return true
        end
    end

    local default_venv = vim.fn.expand("~/pythonvim/.venv")
    if vim.fn.executable(default_venv .. "/bin/python") == 1 then
        vim.g.python3_host_prog = default_venv .. "/bin/python"
        vim.env.VIRTUAL_ENV = default_venv
        vim.env.PATH = default_venv .. "/bin:" .. vim.env.PATH
        print("using default venv: " .. default_venv)
    else
        vim.g.python3_host_prog = vim.fn.exepath("python3")
        print("using system python")
    end
end

Find_and_use_venv()
