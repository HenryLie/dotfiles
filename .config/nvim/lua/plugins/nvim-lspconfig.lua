return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      svelte = {
        on_attach = function(client)
          if client.name == "svelte" then
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end
        end,
      },
    },
  },
}
