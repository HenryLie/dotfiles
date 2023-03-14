return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- will be automatically installed with mason and loaded with lspconfig
        volar = {},
      },
    },
  },
}
