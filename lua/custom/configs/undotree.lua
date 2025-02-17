return {
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1

    vim.api.nvim_exec(
      [[
          if has("persistent_undo")
             let target_path = expand('~/.local/share/nvim/undodir')

              " create the directory and any parent directories
              " if the location does not exist.
              if !isdirectory(target_path)
                  call mkdir(target_path, "p", 0700)
              endif

              let &undodir=target_path
              set undofile
          endif
      ]],
      false
    )
  end,
}
