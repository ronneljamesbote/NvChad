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
