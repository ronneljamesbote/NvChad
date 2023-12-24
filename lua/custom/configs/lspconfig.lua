local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local flatten_tables = require "custom.helpers.flatten_tables"

local server_configs = {
  web = {
    {
      server = "tsserver",
    },

    {
      server = "html",
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade" },
    },

    {
      server = "emmet_ls",
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade" },
    },

    {
      server = "cssls",
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    },

    {
      server = "tailwindcss",
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade" },
    },

    {
      server = "eslint",
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade", "javascript", "typescript" },
      settings = {
        codeActionOnSave = {
          enable = true,
          mode = "all",
        },
      },
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    },
  },

  php = {
    { server = "phpactor" },
  },

  python = {
    { server = "pyright" },
  },
}

local servers = flatten_tables(server_configs)

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp.filetypes then
    config.filetypes = lsp.filetypes
  end

  if lsp.settings then
    config.settings = lsp.settings
  end

  if lsp.on_attach then
    config.on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      lsp.on_attach(client, bufnr)
    end
  end

  lspconfig[lsp.server].setup(config)
end
