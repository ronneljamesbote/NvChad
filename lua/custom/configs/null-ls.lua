local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- Formatting
  b.formatting.prettier.with {
    prefer_local = "node_modules/.bin",
  },

  b.formatting.blade_formatter,

  b.formatting.pint.with {
    prefer_local = "vendor/bin",
  },

  b.formatting.stylua,
}

local lspFormattingAutogroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = lspFormattingAutogroup, buffer = bufnr }

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = lspFormattingAutogroup,
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
