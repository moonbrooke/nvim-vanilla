-- Lua
vim.lsp.config["lua_ls"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luacheckrc", ".stylua.toml", ".git" },
}

-- Enable LSP
vim.lsp.enable("lua_ls")

-- Diagnostic
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
})
