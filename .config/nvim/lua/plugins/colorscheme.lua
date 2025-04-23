return {
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      transparent_background = true,
      background_clear = {
        "float_win",
        "toggleterm",
        "telescope",
        "telescope",
        "which-key",
        "renamer",
        "neo-tree",
      },
      override = function(colors)
        return {
          CursorColumn = {
            bg = colors.base.dimmed5,
          },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
  {
    "nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "monokai-pro",
    },
  },
}
