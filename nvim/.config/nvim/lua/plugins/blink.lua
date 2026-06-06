return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = { auto_show = true, draw = { treesitter = { "lsp" } } },
      ghost_text = { enabled = true, show_with_menu = true },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
      providers = {
        snippets = { opts = { friendly_snippets = false } },
        path = {
          -- Path sources triggered by "/" interfere with CopilotChat commands
          enabled = function()
            return vim.bo.filetype ~= "copilot-chat"
          end,
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust",
      prebuilt_binaries = { download = true },
    },
  },
}
