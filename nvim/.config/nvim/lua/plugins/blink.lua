return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = { auto_show = false, draw = { treesitter = { "lsp" } } },
      ghost_text = { enabled = true, show_with_menu = false },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
      providers = { snippets = { opts = { friendly_snippets = false } } },
    },
  },
}
