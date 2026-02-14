return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = { auto_show = true },
      ghost_text = { enabled = false },
    },
    sources = {
      default = { "lsp", "path" },
      providers = { snippets = { opts = { friendly_snippets = false } } },
    },
  },
}
