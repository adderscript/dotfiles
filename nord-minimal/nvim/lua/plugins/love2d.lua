return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                library = {
                  vim.env.VIMRUNTIME,
                  "${3rd}/love2d/library",
                },
              },
              diagnostics = {
                globals = { "love" },
              },
            },
          },
        },
      },
    },
  },
}
