vim.keymap.set("v", "d", '"_d')
vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("n", "<leader>wc", "<cmd>close<CR>")

vim.keymap.set("n", "<leader>r", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%")

  local commands = {
    cpp = "g++ " .. file .. " -o /tmp/a.out && /tmp/a.out",
    odin = "odin run .",
    rust = "cargo run",
    cs = "dotnet run",
  }

  local cmd = commands[ft]

  if cmd then
    vim.cmd("botright split")
    vim.cmd("resize 12")

    -- Create a scratch buffer
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, buf)

    -- Run command in terminal
    vim.fn.termopen(cmd)

    -- Start typing in terminal
    vim.cmd("startinsert")
  else
    print("No runner for " .. ft)
  end
end, { desc = "Run current file" })
