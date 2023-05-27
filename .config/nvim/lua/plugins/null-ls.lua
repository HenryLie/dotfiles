return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    -- opts = function()
    --   local nls = require("null-ls")
    --   return {
    --     sources = {
    --       -- nls.builtins.formatting.prettierd,
    --       nls.builtins.formatting.eslint_d,
    --       nls.builtins.formatting.stylelint.with({
    --         extra_filetypes = { "svelte", "vue" },
    --       }),
    --     },
    --   }
    -- end,
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      -- table.insert(opts.sources, nls.builtins.eslint_d)
      table.insert(
        opts.sources,
        nls.builtins.formatting.stylelint.with({
          extra_filetypes = { "svelte", "vue" },
        })
      )
    end,
  },
}
