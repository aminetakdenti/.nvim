return {
  "NvChad/nvterm",
  config = function()
    require("nvterm").setup()

    local terminal = require("nvterm.terminal")
    local toggle_modes = { "n", "t" }
    local mappings = {
      -- {
      --   "n",
      --   "<C-l>",
      --   function()
      --     terminal.send(ft_cmds[vim.bo.filetype])
      --   end,
      -- },
      {
        toggle_modes,
        "<leader>h",
        function()
          terminal.toggle("horizontal")
        end,
      },
      {
        toggle_modes,
        "<leader>v",
        function()
          terminal.toggle("vertical")
        end,
      },
      {
        toggle_modes,
        "<A-i>",
        function()
          terminal.toggle("float")
        end,
      },
    }
    local opts = { noremap = true, silent = true }
    for _, mapping in ipairs(mappings) do
      vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
    end

    -- vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    vim.keymap.set("t", "<C-x>", "<C-\\><C-N>")
  end,
}
