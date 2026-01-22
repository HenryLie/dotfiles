return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "dockerfile",
        "git_config",
        "scss",
        "styled",
        "svelte",
        "vue",
      })
    end,
  },
}
