return {
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
  {
    "loctvl842/monokai-pro.nvim",
    -- version = "1.1.2",
    lazy = true,
    opts = {
      transparent_background = true,
      inc_search = "background",
      italic_comments = true,
      override = function(c)
        ColorColumn = { bg = c.base.dimmed3 }
      end
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
