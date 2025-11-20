require("options")
require("keymaps")
require("autocmds")
require("statusline")
require("colorscheme")
require("diagnostic")
require("autopair")

-- Enable LSP
vim.lsp.enable("lua_ls")
vim.lsp.enable("cssls")
vim.lsp.enable("ts_ls")
