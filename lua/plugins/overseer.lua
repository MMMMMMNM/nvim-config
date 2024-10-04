return {
  {
    "stevearc/overseer.nvim",
    keys = {
      { "<leader>vo", "<cmd>OverseerRun<cr>", desc = "OverseerRun" },
    },
    dependencies = {
      "stevearc/dressing.nvim",
    },
    opts = {
      templates = { "builtin", "user.cpp_build" },
      --[[  templates = { "builtin", "user.run_script" }, ]]
    },
  },
}
