return {
  'theprimeagen/harpoon',
  keys = {
    {
      "<C-e>",
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "view harpooned files"
    },
    {
      "<leader>m",
      function() require("harpoon.mark").add_file() end,
      desc = "add file to harpoon list"
    },
    {
      "<leader>m1",
      function() require("harpoon.ui").nav_file(1) end,
      desc = "go to first file"
    },
    {
      "<leader>m2",
      function() require("harpoon.ui").nav_file(2) end,
      desc = "go to second file"
    },
    {
      "<leader>m3",
      function() require("harpoon.ui").nav_file(3) end,
      desc = "go to third file"
    },
    {
      "<leader>m4",
      function() require("harpoon.ui").nav_file(4) end,
      desc = "go to fourth file"
    },
    {
      "<leader>m5",
      function() require("harpoon.ui").nav_file(5) end,
      desc = "go to fifth file"
    },
  },
}
