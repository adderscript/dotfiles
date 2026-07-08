return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 10,
    open_mapping = [[<c-/>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    persist_mode = true,

    direction = "horizontal",

    close_on_exit = false,

    shell = "/bin/bash",
  },
}
