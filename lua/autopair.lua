-- Autopair
vim.keymap.set("i", "(", "()<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "[", "[]<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "{", "{}<Left>", { noremap = true, silent = true })

-- Quotes
vim.keymap.set("i", "\"", "\"\"<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "'", "''<Left>", { noremap = true, silent = true })
