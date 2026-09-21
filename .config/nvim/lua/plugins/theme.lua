return {
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "xiyaowong/transparent.nvim",
    opts = {
      extra_groups = {
        "NormalFloat",
        "NeoTreeNormal",
      },
    },
    config = function(_, opts)
      require("transparent").setup(opts)
      vim.cmd("TransparentEnable")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "miasma",
    },
  },
}
