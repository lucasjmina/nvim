require("mini.base16").setup({
    palette = {
        base00 = "#fafafa",
        base01 = "#f0f0f1",
        base02 = "#e5e5e6",
        base03 = "#a0a1a7",
        base04 = "#696c77",
        base05 = "#383a42",
        base06 = "#202227",
        base07 = "#090a0b",
        base08 = "#ca1243",
        base09 = "#d75f00",
        base0A = "#c18401",
        base0B = "#50a14f",
        base0C = "#0184bc",
        base0D = "#4078f2",
        base0E = "#a626a4",
        base0F = "#986801"
    }
})
-- vim.api.nvim_set_hl(0, "Operator", {fg='#ca1243'})
vim.api.nvim_set_hl(0, "MiniTrailspace",  { fg='#ca1243', bg=nil, strikethrough=true })
vim.api.nvim_set_hl(0, "Visual", { bg="#d1d1d1" })
vim.g.colors_name = "base16_colors"
