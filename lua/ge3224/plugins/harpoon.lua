return {
  'theprimeagen/harpoon',
  keys = {
    {
      "<leader>H",
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "view harpooned files"
    },
    {
      "<leader>hm",
      function() require("harpoon.mark").add_file() end,
      desc = "add file to harpoon list"
    },
    {
      "<leader>h1",
      function() require("harpoon.ui").nav_file(1) end,
      desc = "go to first file"
    },
    {
      "<leader>h2",
      function() require("harpoon.ui").nav_file(2) end,
      desc = "go to second file"
    },
    {
      "<leader>h3",
      function() require("harpoon.ui").nav_file(3) end,
      desc = "go to third file"
    },
    {
      "<leader>h4",
      function() require("harpoon.ui").nav_file(4) end,
      desc = "go to fourth file"
    },
    {
      "<leader>h5",
      function() require("harpoon.ui").nav_file(5) end,
      desc = "go to fifth file"
    },
  },
}
