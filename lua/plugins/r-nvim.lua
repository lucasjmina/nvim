return {
  "R-nvim/R.nvim",
  lazy = false,
  config = function ()
    require("r").setup({
      rconsole_width = 0,
      rconsole_height = 10,
      pdfviewer = "",
      setwd = "nvim",
      df_viewer = "View(%s)",
      objbr_auto_start = true,
      hl_term = false
    })
  end
}
