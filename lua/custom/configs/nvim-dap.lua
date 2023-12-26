local dap_settings = {
  php = {
    adapter = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath "data" .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
    },
    configurations = {
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug (Laravel Sail)",
        port = 9003,
        hostname = "127.0.0.1",
        pathMappings = {
          ["/var/www/html"] = "${workspaceFolder}",
        },
      },
    },
  },

  -- Go debugger tool
  delve = {
    adapter = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    },
  },

  go = {
    configurations = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      -- works with go.mod packages and sub packages
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    },
  },
}

local setup = function(settings)
  local dap = require "dap"

  for key, opt in pairs(settings) do
    dap.adapters[key] = opt.adapter

    dap.configurations[key] = opt.configurations
  end
end

return {
  init = function()
    require("core.utils").load_mappings "dap"
  end,

  config = function()
    setup(dap_settings)
  end,
}
