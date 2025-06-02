return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    notifier = { enabled = true },
    scope = {
      enable = true,
      treesitter = {
        blocks = { enabled = true },
      },
    },
  }
}
