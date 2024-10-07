return {
  "navarasu/onedark.nvim",
  priority = 1000, -- Ensure it loads first
  config = function ()
    require("onedark").setup({
      style = "light",
      highlights = {
        MatchParen = { bg = "$bg3" }
      }
    })
  end
}
