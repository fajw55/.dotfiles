return {
  "folke/snacks.nvim",
  opts = {
    animate = {
      enabled = false,
    },
    gitbrowse = {
      enabled = false,
    },
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
    terminal = {
      enabled = false,
    },
  },
  keys = {
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
  },
}
