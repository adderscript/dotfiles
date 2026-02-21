return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ts_ls = {},
        astro = {},
        gopls = {},
        rust_analyzer = {},
        clangd = {},
      }
    }
  }
}
