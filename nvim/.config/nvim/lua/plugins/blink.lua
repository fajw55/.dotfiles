return {
  "saghen/blink.cmp",
  version = "v1.*",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  opts = {
    completion = {
      menu = {
        auto_show = true,
        -- draw = { treesitter = { "lsp" } },
      },
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = false,
        show_with_menu = false,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },
    cmdline = {
      enabled = true,
      keymap = { preset = "cmdline" },
      completion = {
        menu = { auto_show = true },
      },
    },
    sources = {
      default = { "lsp", "path", "buffer", "snippets" },
    },
    fuzzy = {
      implementation = "prefer_rust",
      prebuilt_binaries = { download = true },
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },
    snippets = {
      preset = "luasnip",
    },
  },
}
