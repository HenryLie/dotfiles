return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    -- Need to override the default sources table instead of doing table.insert
    -- in order to override the lazy plugin's default sources.
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettierd.with({
            -- Bugged behavior with alacritty's yaml settings,
            -- causing the file to get truncated on format.
            disabled_filetypes = { "yaml" },
          }),
          nls.builtins.formatting.stylelint.with({
            extra_filetypes = { "svelte", "vue" },
          }),
        },
      }
    end,
  },
}
