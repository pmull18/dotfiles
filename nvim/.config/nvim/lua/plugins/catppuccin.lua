return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- ensure it loads first
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
