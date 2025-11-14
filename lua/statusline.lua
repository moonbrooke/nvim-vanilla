-- Custom colors
-- vim.api.nvim_set_hl(0, "StatusLineMode", { fg = "#ff9ecd", bg = "#1a1b26", bold = true })
-- vim.api.nvim_set_hl(0, "StatusLineFile", { fg = "#9ece6a", bg = "#1a1b26" })
-- vim.api.nvim_set_hl(0, "StatusLineInfo", { fg = "#7aa2f7", bg = "#1a1b26" })
-- vim.api.nvim_set_hl(0, "StatusLinePos", { fg = "#f5a97f", bg = "#1a1b26", bold = true })

-- Mode mapping
local modes = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "VISUAL LINE",
    [""] = "VISUAL BLOCK", -- Ctrl+v
    c = "COMMAND",
    R = "REPLACE",
    s = "SELECT",
    S = "SELECT LINE",
    t = "TERMINAL",
}

function StatusLine()
    local mode_code = vim.fn.mode()
    local mode = modes[mode_code] or mode_code

    local file = vim.fn.expand("%:t") ~= "" and vim.fn.expand("%:t") or "[No Name]"
    local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "none"
    local line = vim.fn.line(".")
    local col = vim.fn.col(".")
    local percent = math.floor(vim.fn.line(".") * 100 / vim.fn.line("$"))

    return table.concat({
        "%#PmenuSel# " .. mode .. " %#Normal#",
        "%#Dummy# " .. file .. " ",
        "%#Dummy# [" .. ft .. "] ",
        "%=",
        "%#TabLineSel# " .. line .. ":" .. col .. " " .. percent .. "%% ",
    })
end

vim.opt.statusline = "%!v:lua.StatusLine()"
-- vim.opt.statusline = "%#PmenuSel# %f %#Normal# %y %= %l:%c %p%%"

