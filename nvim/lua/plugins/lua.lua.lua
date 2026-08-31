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
                  vim.env.HOME .. "/.local/share/love2d-types",
                },
              },
            },
          },
        },
      },
    },
  },
}
