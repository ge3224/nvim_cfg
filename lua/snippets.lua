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

ls.snippets = {
  all = {
  },
  typescript = {
    ls.parser.parse_snippet('f', 'for (let i = 0; i < $1.length; i++) {\n\t$0\n}'),
  },
  scss = {
    -- basic selector
    ls.parser.parse_snippet('.', '.$1 {\n\t$0\n}'),

    -- media queries
    ls.parser.parse_snippet('m', '@media screen and (min-width: $1) {\n\t$0\n}'),

    -- setting up a default grid for a component
    ls.parser.parse_snippet('mf', '.$0 {\n\tdisplay: block;\n\n\t@media screen and (min-width: vars.\\$sm) {\n\t\tbackground: pink;\n\t}\n\n\t@media screen and (min-width: vars.\\$md) {\n\t\tbackground: lightblue;\n\t}\n\n\t@media screen and (min-width: vars.\\$lg) {\n\t\tbackground: lightgreen;\n\t}\n\n\t@media screen and (min-width: vars.\\$xl) {\n\t\tbackground: orange;\n\t}\n}'),
  },
  html = {
    -- anchor tags with class
    ls.parser.parse_snippet('a', '<a class="$1" href="$2">$0</a>'),

    -- div tags with class
    ls.parser.parse_snippet('d', '<div class="$1">\n\t$0\n</div>'),

    -- div start only
    ls.parser.parse_snippet('ds', '<div class="$0">'),

    -- html boilerplate
    ls.parser.parse_snippet('html', '<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<meta charset="utf-8">\n\t\t<title>$1</title>\n\t</head>\n\t<body>\n\t</body>\n</html>'),

    -- img tag with class
    ls.parser.parse_snippet('img', '<img src="$1" class="$0">'),

    -- srcset block
    ls.parser.parse_snippet('srcset', '<picture class="$1">\n\t<source media="(min-width:1200px)" srcset="$2">\n\t<source media="(min-width:992px)" srcset="$3">\n\t<source media="(min-width:768px)" srcset="$4">\n\t<source media="(min-width:576px)" srcset="$5">\n\t<img src="$6" alt="$0">\n</picture>'),
    --
    -- misc
    ls.parser.parse_snippet('md', '{{ call . "$0" }}'),
  },
  svelte = {
    -- duplicate of html
    -- div tags with class
    ls.parser.parse_snippet('d', '<div class="$1">\n\t$0\n</div>'),

    -- div start only
    ls.parser.parse_snippet('ds', '<div class="$0">'),

  },
  lua = {
    ls.parser.parse_snippet('mc', '--[[\n$0\n]]--'),
  },
}

--[[
.$0 {\n\tdisplay: block;\n\n\t@media screen and (min-width: vars.$sm) {\n\t\tbackground: pink;\n\t}\n\n\t@media screen and (min-width: vars.$md) {\n\t\tbackground: lightblue;\n\t}\n\n\t@media screen and (min-width: vars.$lg) {\n\t\tbackground: lightgreen;\n\t}\n\n\t@media screen and (min-width: vars.$xl) {\n\t\tbackground: orange;\n\t}\n}

]]--
