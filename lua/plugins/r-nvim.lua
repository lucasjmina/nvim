return {
  "R-nvim/R.nvim",
  lazy = false,
  -- Use latest minor release
  version = "~0.1.0",
  config = function ()
    require("r").setup({
      rconsole_width = 0,
      rconsole_height = 10,
      pdfviewer = "",
      setwd = "nvim",
      -- df_viewer = "View(%s)",
      objbr_auto_start = true,
      hl_term = false,
      R_args = {"--no-save", "--no-restore", "--no-site-file"}
    })
  end
}
