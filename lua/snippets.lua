local ls = require "luasnip"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

vim.keymap.set({ "i", "s"}, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s"}, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s"}, "<c-l>", function()
  if ls.choice_active() then
    ls.choice_active(1)
  end
end, { silent = true })

-- source snippets.lua
local srcmd = "nvim/lua/snippets.lua<CR>"
local os = vim.loop.os_uname().sysname

if os == "Linux" then
  srcmd = "<cmd>luafile ~/.config/" .. srcmd
elseif os == "Windows_NT" then
  srcmd = "<cmd>luafile $LOCALAPPDATA/" .. srcmd
end

vim.keymap.set("n", "<leader>ss", srcmd)

local es = {
  loop = { 'f', 'for (let i = 0; i < $1.length; i++) {\n\t$0\n}'},
}

local html = {
    -- html boilerplate
    doc_type = {'html', '<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<meta charset="utf-8">\n\t\t<title>$1</title>\n\t</head>\n\t<body>\n\t</body>\n</html>'},

    -- a tag
    anchor = {'a', '<a class="$1" href="$2">$0</a>'},

    -- div tags with class
    div = {'d', '<div class="$1">\n\t$0\n</div>'},

    -- div start only
    div_start = {'ds', '<div class="$0">'},

    -- img tag with class
    img = {'img', '<img src="$1" class="$0">'},

    -- srcset block
    srcset = {'srcset', '<picture class="$1">\n\t<source media="(min-width:1200px)" srcset="$2">\n\t<source media="(min-width:992px)" srcset="$3">\n\t<source media="(min-width:768px)" srcset="$4">\n\t<source media="(min-width:576px)" srcset="$5">\n\t<img src="$6" alt="$0">\n</picture>'},

    -- https://github.com/yuin/goldmark
    goldmark = {'md', '{{ call . "$0" }}'},
}

local css = {
    -- basic selector
    class_selector = {'.', '.$1 {\n\t$0\n}'},

    -- media queries
    media_query = {'m', '@media screen and (min-width: $1) {\n\t$0\n}'},

    -- setting up a default grid for a component
    grid = {'mf', '.$0 {\n\tdisplay: block;\n\n\t@media screen and (min-width: vars.\\$sm) {\n\t\tbackground: pink;\n\t}\n\n\t@media screen and (min-width: vars.\\$md) {\n\t\tbackground: lightblue;\n\t}\n\n\t@media screen and (min-width: vars.\\$lg) {\n\t\tbackground: lightgreen;\n\t}\n\n\t@media screen and (min-width: vars.\\$xl) {\n\t\tbackground: orange;\n\t}\n}'},
}


ls.snippets = {
  all = {
  },
  typescript = {
    ls.parser.parse_snippet(es.loop[1], es.loop[2]),
  },
  javascript = {
    ls.parser.parse_snippet(es.loop[1], es.loop[2]),
  },
  scss = {
    ls.parser.parse_snippet(css.class_selector[1], css.class_selector[2]),
    ls.parser.parse_snippet(css.media_query[1], css.class_selector[2]),
    ls.parser.parse_snippet(css.grid[1], css.grid[2]),
  },
  css = {
    ls.parser.parse_snippet(css.class_selector[1], css.class_selector[2]),
    ls.parser.parse_snippet(css.media_query[1], css.class_selector[2]),
    ls.parser.parse_snippet(css.grid[1], css.grid[2]),
  },
  html = {
    ls.parser.parse_snippet(html.div[1], html.div[2]),
    ls.parser.parse_snippet(html.div_start[1], html.div_start[2]),
    ls.parser.parse_snippet(html.doc_type[1], html.doc_type[2]),
    ls.parser.parse_snippet(html.img[1], html.img[2]),
    ls.parser.parse_snippet(html.srcset[1], html.srcset[2]),
    ls.parser.parse_snippet(html.goldmark[1], html.goldmark[2]),
  },
  svelte = {
    ls.parser.parse_snippet(es.loop[1], es.loop[2]),
    ls.parser.parse_snippet(html.div[1], html.div[2]),
    ls.parser.parse_snippet(html.div_start[1], html.div_start[2]),
    ls.parser.parse_snippet(html.doc_type[1], html.doc_type[2]),
    ls.parser.parse_snippet(html.img[1], html.img[2]),
    ls.parser.parse_snippet(html.srcset[1], html.srcset[2]),
    ls.parser.parse_snippet(html.goldmark[1], html.goldmark[2]),
  },
  lua = {
    ls.parser.parse_snippet('mc', '--[[\n$0\n]]--'),
  },
}
