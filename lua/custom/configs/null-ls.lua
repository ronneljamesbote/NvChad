local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local null_ls = require "null-ls"

local builtins = null_ls.builtins

local sources = {
  builtins.formatting.blade_formatter,

  builtins.formatting.prettier.with {
    prefer_local = "node_modules/.bin",
    extra_filetypes = { "blade" },
  },

  builtins.formatting.pint.with {
    prefer_local = "vendor/bin",
  },

  builtins.formatting.stylua,
}

local lspFormattingAugroup = augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = lspFormattingAugroup, buffer = bufnr }

    autocmd("BufWritePre", {
      group = lspFormattingAugroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { async = false, timeout_ms = 30000 }
      end,
    })
  end
end

null_ls.setup {
  on_attach = on_attach,
  sources = sources,
  debug = true,
}
