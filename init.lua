require("options")
require("keymaps")
require("autocmds")
require("terminal")
require("tabs")

-- Theme
vim.g.tokyonight_style = "night"       -- available: "night", "storm"
vim.g.tokyonight_enable_italic = true  -- enable italics
vim.cmd.colorscheme("tokyonight")
