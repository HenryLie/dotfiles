return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    keys = function()
      return {
        {
          "<leader>tt",
          "<cmd>ToggleTerm direction=float<CR>",
          desc = "floating terminal",
        },
        {
          "<leader>tg",
          "<cmd>lua Ghdash_toggle()<CR>",
          desc = "gh dash",
        },
        {
          "<leader>td",
          "<cmd>lua Lazydocker_toggle()<CR>",
          desc = "lazydocker",
        },
      }
    end,
    opts = function(_, opts)
      local Terminal = require("toggleterm.terminal").Terminal
      local ghdash = Terminal:new({
        cmd = "gh dash",
        direction = "float",
        hidden = true,
        close_on_exit = true,
        on_open = function(term)
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "q", "<cmd>close<CR>", { noremap = true, silent = true })
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true }) -- Still not overriding the default q for macro recording keybinding
        end,
        count = 100,
      })
      ghdash:spawn()
      local lazydocker =
        Terminal:new({ cmd = "lazydocker", direction = "float", hidden = true, close_on_exit = true, count = 101 })

      function Ghdash_toggle()
        ghdash:toggle()
      end
      function Lazydocker_toggle()
        lazydocker:toggle()
      end
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>t", group = "toggleterm" },
      },
    },
  },
}
