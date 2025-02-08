f = {
  name = "Find",
  f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
  b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
  o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
  g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
  c = { "<cmd>FzfLua commands<cr>", "Commands" },
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
},
