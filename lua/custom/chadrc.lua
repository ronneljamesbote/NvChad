local utils = require "custom.utils"

local function fileInfo()
  local empty_string = "Empty "

  local icon = " 󰈚 "
  local project_path = empty_string

  local fullpath = vim.api.nvim_buf_get_name(utils.stbufnr())
  local filename = (fullpath == "" and empty_string) or fullpath:match "([^/\\]+)[/\\]*$"

  if filename ~= empty_string then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

    if devicons_present then
      local ft_icon = devicons.get_icon(filename)

      icon = (ft_icon ~= nil and " " .. ft_icon) or icon
    end

    project_path = utils.replace(fullpath, vim.loop.cwd() .. "/", "")

    if project_path:len() > 120 then
      project_path = "..." .. filename
    end
  end

  return "%#StText# " .. icon .. " " .. project_path .. " "
end

---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  transparency = true,
  statusline = {
    theme = "vscode_colored",
    overriden_modules = function(modules)
      modules[2] = fileInfo()
    end,
  },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
