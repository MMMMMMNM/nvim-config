return{
{
    "hedyhli/outline.nvim",
    keys = {
      { "<leader>mO", "<cmd>Outline<CR>", desc = "Open Outline" },
    },
    cmd = { "Outline", "OutlineOpen" },
    config = function() require("outline").setup {} end,
  },
}
