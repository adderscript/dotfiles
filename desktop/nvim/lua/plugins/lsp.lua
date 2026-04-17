return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ts_ls = {},
        astro = {},
        omnisharp = {},
        gopls = {},
        rust_analyzer = {},
        clangd = {},
      },
    },
  },
}
