-- Autopair
vim.keymap.set("i", "(", "()<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "[", "[]<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "{", "{}<Left>", { noremap = true, silent = true })

-- Smart enter
vim.keymap.set("i", "<CR>", function()
    local line = vim.fn.getline(".")
    local col = vim.fn.col(".")
    local prev_char = string.sub(line, col - 1, col - 1)
    local next_char = string.sub(line, col, col)

    if (prev_char == "{" and next_char == "}") or
        (prev_char == "[" and next_char == "]") or
        (prev_char == "(" and next_char == ")") then
        return "<CR><Esc>O"
    end
    return "<CR>"
end, { expr = true, noremap = true })

-- Quotes
vim.keymap.set("i", "\"", "\"\"<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "'", "''<Left>", { noremap = true, silent = true })
