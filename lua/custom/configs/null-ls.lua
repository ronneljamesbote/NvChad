local flatten_tables = require "custom.helpers.flatten_tables"
local format_file = require "custom.helpers.format_file"

local formattingAugroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
  config = function()
    local null_ls = require "null-ls"

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
      debug = true,
      sources = flatten_tables(required_sources),
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds { group = formattingAugroup, buffer = bufnr }

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = formattingAugroup,
            buffer = bufnr,
            callback = format_file,
          })
        end
      end,
    }
  end,
}
