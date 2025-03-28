return {
  {
    "nvim-treesitter/playground",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "bash",
        "diff",
        "dockerfile",
        "git_config",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "scss",
        "styled",
        "svelte",
        "typescript",
        "tsx",
        "vue",
      })
    end,
  },
}
