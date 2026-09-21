return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local mode = {
      "mode",
      fmt = function(str)
        -- return ' '
        -- displays only the first character of the mode
        return " " .. str
      end,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      -- cond = hide_in_width,
    }

    local filename = {
      "filename",
      file_status = true,
      path = 0,
    }

    local branch = { "branch", icon = { "" }, "|" }

    -- configure lualine with modified theme
    lualine.setup({
      icons_enabled = true,
      options = {
        theme = "ayu_mirage", -- "gruvbox",
        -- component_separators = { left = "|", right = "|" },
        -- section_separators = { left = "|", right = "" },
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch, diff },
        lualine_c = { filename, "diagnostics" },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "filetype" },
          { "lsp_status" },
        },
      },
    })
  end,
}
