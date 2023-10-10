local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- Web Dev stuff
  b.formatting.prettier.with {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
    },
    prefer_local = "node_modules/.bin",
  },

  -- PHP stuff
  b.formatting.pint.with {
    prefer_local = "vendor/bin/pint",
  },
  b.formatting.blade_formatter,

  -- Lua stuff
  b.formatting.stylua,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end
end

null_ls.setup {
  on_attach = on_attach,
  debug = true,
  sources = sources,
}
