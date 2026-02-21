return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    -- Setup toggleterm defaults
    toggleterm.setup({
      size = 10,               -- terminal height
      open_mapping = [[<c-`]], -- toggle key
      hide_numbers = true,     -- hide line numbers
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,   -- enter insert mode automatically
      insert_mappings = true,
      persist_size = true,      -- remember terminal size when toggled
      direction = "horizontal", -- bottom split
      close_on_exit = false,    -- don't close terminal when process exits
      shell = vim.o.shell,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- Persistent terminal object
    local bottom_terminal = Terminal:new({
      cmd = vim.o.shell,
      hidden = false
    })

    -- Function to toggle terminal
    function _bottom_terminal_toggle()
      bottom_terminal:toggle()
    end

    -- Keymap to toggle manually
    vim.api.nvim_set_keymap(
      "n",
      "<leader>t",
      "<cmd>lua _bottom_terminal_toggle()<CR>",
      { noremap = true, silent = true }
    )
  end,
}
