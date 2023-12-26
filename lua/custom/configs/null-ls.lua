local flatten_tables = require "custom.helpers.flatten_tables"

local autocmd = vim.api.nvim_create_autocmd

local augroup = vim.api.nvim_create_augroup

return {
  config = function()
    local null_ls = require "null-ls"

    local on_attach = function(client, bufnr)
      local formattingAugroup = augroup("LspFormatting", {})

      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = formattingAugroup, buffer = bufnr }

        autocmd("BufWritePre", {
          group = formattingAugroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { async = false, timeout_ms = 30000 }
          end,
        })
      end
    end

    local builtins = null_ls.builtins

    local required_sources = {
      web = {
        builtins.formatting.prettier.with {
          prefer_local = "node_modules/.bin",
          extra_filetypes = { "blade" },
        },
      },

      lua = {
        builtins.formatting.stylua,
      },

      php = {
        builtins.formatting.pint.with {
          prefer_local = "vendor/bin",
        },
        builtins.diagnostics.phpstan,
      },

      go = {
        builtins.formatting.gofumpt,
        builtins.formatting.goimports_reviser,
      },

      python = {
        builtins.formatting.black,
        builtins.diagnostics.mypy,
        builtins.diagnostics.ruff,
      },
    }

    null_ls.setup {
      sources = flatten_tables(required_sources),
      on_attach = on_attach,
      debug = true,
    }
  end,
}
