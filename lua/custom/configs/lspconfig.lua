local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "tsserver", "phpactor", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local htmlRelatedServers = { "html", "emmet_ls" }

local htmlFileTypes = {
  "html",
  "javascript",
  "javascriptreact",
  "typescriptreact",
  "vue",
  "blade",
}

for _, lsp in ipairs(htmlRelatedServers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = htmlFileTypes,
  }
end

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
  filetypes = htmlFileTypes,
}
