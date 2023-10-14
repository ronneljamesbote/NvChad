-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local bladeFiletypeRelated = vim.api.nvim_create_augroup("BladeFiletypeRelated", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.blade.php",
  group = bladeFiletypeRelated,
  callback = function()
    vim.opt.filetype = "blade"
  end,
})

vim.opt.wrap = false

vim.opt.whichwrap = vim.opt.whichwrap["_value"]:gsub("hl", "")
