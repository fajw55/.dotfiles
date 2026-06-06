return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    if LazyVim.has_extra("ai.sidekick") then
      return
    end
    table.insert(
      opts.sections.lualine_x,
      2,
      LazyVim.lualine.status(LazyVim.config.icons.kinds.Copilot, function()
        local clients = vim.lsp.get_clients({ name = "copilot", bufnr = 0 })
        return #clients > 0 and status[clients[1].id] or nil
      end)
    )
  end,
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
        theme = "gruvbox",
        -- component_separators = { left = "|", right = "|" },
        -- section_separators = { left = "|", right = "" },
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { diff, filename },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          -- { "encoding" },
          -- { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
