return {
  -- NOTE: opencode
  {
    "sudo-tee/opencode.nvim",
    config = function()
      require("opencode").setup({})
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
          file_types = { "markdown", "opencode_output" },
        },
        ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
      },
      -- Optional, for file mentions and commands completion, pick only one
      "saghen/blink.cmp",
      -- 'hrsh7th/nvim-cmp',
      -- Optional, for file mentions picker, pick only one
      "folke/snacks.nvim",
      -- 'nvim-telescope/telescope.nvim',
      -- 'ibhagwan/fzf-lua',
      -- 'nvim_mini/mini.nvim',
    },
  },
  -- NOTE: copilot (zbirenbaum)
  -- {
  --   -- "github/copilot.vim",
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- },
  -- NOTE: copilot-cmp
  -- {
  -- 	"zbirenbaum/copilot-cmp",
  -- 	config = function()
  -- 		require("copilot_cmp").setup({
  -- 			event = { "InsertEnter", "LspAttach" },
  -- 			fix_pairs = true,
  -- 		})
  -- 	end,
  -- },
  -- NOTE: CopilotChat
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" },
  --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  --   },
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   keys = {
  --     { "<leader>åc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
  --     { "<leader>åe", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain code" },
  --     { "<leader>år", ":CopilotChatReview<CR>", mode = "v", desc = "Review code" },
  --     { "<leader>åf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix code issues" },
  --     { "<leader>åo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize code" },
  --     { "<leader>åd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate docs" },
  --     { "<leader>åt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate tests" },
  --     { "<leader>åm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate commit message" },
  --   },
  -- },
}
