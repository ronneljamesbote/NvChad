local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  { server = "tsserver" },
  { server = "phpactor" },
  { server = "html", filetypes = { "html", "blade" } },
  {
    server = "emmet_ls",
    filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade" },
  },
  {
    server = "eslint",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "blade",
    },
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
  {
    server = "cssls",
    settings = {
      css = { validate = true, lint = {
        unknownAtRules = "ignore",
      } },
      scss = { validate = true, lint = {
        unknownAtRules = "ignore",
      } },
      less = { validate = true, lint = {
        unknownAtRules = "ignore",
      } },
    },
  },
  {
    server = "tailwindcss",
    filetypes = {
      "html",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "blade",
    },
  },
}

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
