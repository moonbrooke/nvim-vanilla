-- Custom colors
vim.api.nvim_set_hl(0, "SLBG", { bg = "#24283b", bold = true })
vim.api.nvim_set_hl(0, "SLMode", { fg = "#1a1b26", bg = "#9ece6a", bold = true })
vim.api.nvim_set_hl(0, "SLLineCol", { fg = "#1a1b26", bg = "#c0caf5", bold = true })
vim.api.nvim_set_hl(0, "SLFile", { fg = "#9aa5ce", bg = "#24283b", bold = true })
vim.api.nvim_set_hl(0, "SLModified", { fg = "#e0af68", bg = "#24283b", bold = true })
vim.api.nvim_set_hl(0, "SLFileType", { fg = "#565f89", bg = "#24283b", bold = true })

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
    local mod = vim.bo.modified and " [+] " or " "
    local line = vim.fn.line(".")
    local col = vim.fn.col(".")
    local percent = math.floor(vim.fn.line(".") * 100 / vim.fn.line("$"))

    return table.concat({
        "%#SLMode# " .. mode .. " ",
        "%#SLFile# " .. file .. "",
        "%#SLModified#" .. mod .. "",
        "%#SLFileType#[" .. ft .. "] ",
        "%#SLBG#%=",
        "%#SLLineCol# " .. line .. ":" .. col .. " " .. percent .. "%% ",
    })
end

vim.opt.statusline = "%!v:lua.StatusLine()"
