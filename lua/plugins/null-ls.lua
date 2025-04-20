-- ~/.config/nvim/lua/plugins/none-ls.lua

return {
  {
    'nvimtools/none-ls.nvim', -- replaced null-ls
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require 'null-ls'

      null_ls.setup {
        sources = {
          null_ls.builtins.diagnostics.cppcheck,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
}
