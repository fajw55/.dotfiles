return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>cc", ":CopilotChat<CR>",         mode = "n", desc = "Chat with Copilot" },
      { "<leader>ce", ":CopilotChatExplain<CR>",  mode = "v", desc = "Explain code" },
      { "<leader>cr", ":CopilotChatReview<CR>",   mode = "v", desc = "Review code" },
      { "<leader>cf", ":CopilotChatFix<CR>",      mode = "v", desc = "Fix code issues" },
      { "<leader>co", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize code" },
      { "<leader>cd", ":CopilotChatDocs<CR>",     mode = "v", desc = "Generate docs" },
      { "<leader>ct", ":CopilotChatTests<CR>",    mode = "v", desc = "Generate tests" },
      { "<leader>cm", ":CopilotChatCommit<CR>",   mode = "n", desc = "Generate commit message" },
    },
  },
}
