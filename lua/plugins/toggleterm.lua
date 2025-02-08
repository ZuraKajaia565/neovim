-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-t>]],
        direction = "horizontal",
      })
    end,
  },
}
