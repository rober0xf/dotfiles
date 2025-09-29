require("lazy_init")

vim.opt.showmode = false

vim.cmd("hi StatusLine guibg=#181818 guifg=#ffffff")
vim.cmd('hi! LineNr guibg=#181818 guifg=#555555')
vim.cmd("hi MsgArea guibg=#181818 guifg=#c5c8c6")
vim.opt.guifont = "JetBrainsMono:h13"

vim.opt.guicursor = {
    "n-v-c:block",
    "i-ci-ve:ver25",
    "r-cr:hor20",
    "o:hor50",
}

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "set guicursor=a:ver25",
})

vim.keymap.set('i', '<CR>', function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]

    if col > 0 and col < #line then
        local prev_char = line:sub(col, col)
        local next_char = line:sub(col + 1, col + 1)

        local pairs = {
            ['{'] = '}',
            ['('] = ')',
            ['['] = ']'
        }

        if pairs[prev_char] == next_char then
            return '<CR><Esc>O'
        end
    end

    return '<CR>'
end, { expr = true, noremap = true })
