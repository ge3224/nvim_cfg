return {
  'theprimeagen/harpoon',
  keys = {
    {
      "<leader>y",
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "view harpooned files"
    },
    {
      "<leader>H",
      function() require("harpoon.mark").add_file() end,
      desc = "add file to harpoon list"
    },
    {
      "<leader>u",
      function() require("harpoon.ui").nav_file(1) end,
      desc = "go to first file"
    },
    {
      "<leader>i",
      function() require("harpoon.ui").nav_file(2) end,
      desc = "go to second file"
    },
    {
      "<leader>o",
      function() require("harpoon.ui").nav_file(3) end,
      desc = "go to third file"
    },
    {
      "<leader>p",
      function() require("harpoon.ui").nav_file(4) end,
      desc = "go to fourth file"
    },
  },
}
