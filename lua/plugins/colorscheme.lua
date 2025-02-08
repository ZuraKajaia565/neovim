--
-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  {
    'morhetz/gruvbox',
    config = function()
      -- Set the background to dark mode
      vim.o.background = 'dark'
      -- Apply the Gruvbox colorscheme
      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
