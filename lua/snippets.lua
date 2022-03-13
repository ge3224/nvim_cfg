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

  element = { 'e', '<$1 class"$2">$3</$0>' },

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
    -- basic selectors
    class_selector = {'c', '.$1 {\n\t$0\n}'},

    element_selector = {'e', '$1 {\n\t$0\n}'},

    id_selector = {'i', '#$1 {\n\t$0\n}'},

    -- media queries
    media_query = {'m', '@media screen and (min-width: $1) {\n\t$0\n}'},

    -- setting up a default grid for a component
    grid = {'mf', '.$0 {\n\tdisplay: block;\n\n\t@media screen and (min-width: vars.\\$sm) {\n\t\tbackground: pink;\n\t}\n\n\t@media screen and (min-width: vars.\\$md) {\n\t\tbackground: lightblue;\n\t}\n\n\t@media screen and (min-width: vars.\\$lg) {\n\t\tbackground: lightgreen;\n\t}\n\n\t@media screen and (min-width: vars.\\$xl) {\n\t\tbackground: orange;\n\t}\n}'},
}

local lua = {
  block_comments = {'mc', '--[[\n$0\n]]--'}
}

local function parse_snippet_collection(filetype, collection)
  if ls.snippets[filetype] == nil then
    ls.snippets[filetype] = {}
  end

  local f = ls.snippets[filetype]
  for _, snippet in pairs(collection) do
    table.insert(f, ls.parser.parse_snippet(snippet[1], snippet[2]))
  end
end

parse_snippet_collection("html", html)
parse_snippet_collection("javascript", es)
parse_snippet_collection("typescript", es)
parse_snippet_collection("svelte", es)
parse_snippet_collection("svelte", html)
parse_snippet_collection("css", css)
parse_snippet_collection("scss", css)
parse_snippet_collection("lua", lua)
