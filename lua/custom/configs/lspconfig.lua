local on_attach = require("plugins.configs.lspconfig").on_attach

local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local util = require "lspconfig/util"

local server_configs = {
  web = {
    html = {
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue" },
    },
    emmet_ls = {
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade" },
    },
    tailwindcss = {
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade" },
    },
    cssls = {
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
  },

  javascript = {
    tsserver = {},
    eslint = {
      filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "blade", "javascript", "typescript" },
      settings = {
        codeActionOnSave = {
          enable = true,
          mode = "all",
        },
      },
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
      end,
    },
  },

  go = {
    gopls = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    },
  },

  php = {
    phpactor = {},
  },

  python = {
    pyright = {
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
      },
    },
    ruff_lsp = {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
      end,
    },
  },
}

local configure = function(opts)
  if opts.on_attach == nil then
    opts.on_attach = on_attach
  end

  opts.capabilities = capabilities

  return opts
end

return {
  config = function()
    for _, language in pairs(server_configs) do
      for name, server in pairs(language) do
        local config = configure(server)

        lspconfig[name].setup(config)
      end
    end
  end,
}
