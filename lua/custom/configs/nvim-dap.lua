return {
  init = function()
    require("core.utils").load_mappings "dap"
  end,

  config = function()
    local dap = require "dap"

    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath "data" .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
    }

    dap.configurations.php = {
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
    }
  end,
}
