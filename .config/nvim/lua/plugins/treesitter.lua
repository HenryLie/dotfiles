return {
  {
    "nvim-treesitter/playground",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "scss",
        "svelte",
        "vue",
      })
    end,
  },
}
