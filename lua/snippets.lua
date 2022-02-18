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

ls.snippets = {
  all = {
  },
  scss = {
    -- basic selector
    ls.parser.parse_snippet('s', '.$1 {\n\t$0\n}'),

    -- media queries
    ls.parser.parse_snippet('m', '\t@media screen and (min-width: $1) {\n\t\t$0\n\t}'),

    -- setting up a default grid for a component
    ls.parser.parse_snippet('g', '.$1 {\n\tdisplay: block;\n\n\t@media screen and (min-width: $2) {\n\t\tbackground: pink;\n\t}\n\n\t @media screen and (min-width: $3) {\n\t\tbackground: orange;\n\t}\n\n\t@media screen and (min-width: $4) {\n\t\tbackground: lightgreen;\n\t}\n\n\t@media screen and (min-width: $5) {\n\tbackground: lightblue;\n\t}\n\n}\n\n.$6__1 { grid-area: aa; }\n.$7__2 { grid-area: ab; }\n.$8__3 { grid-area: ba; }\n.$9__4 { grid-area: bb; }\n.$10__5 { grid-area: ca; }\n.$0__6 { grid-area: cb; }\n\n'),
  },
  html = {
    -- anchor tags with class
    ls.parser.parse_snippet('a', '<a class="$1" href="$2">$0</a>'),

    -- div tags with class
    ls.parser.parse_snippet('d', '<div class="$1">\n\t$0\n</div>'),

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
  lua = {
    ls.parser.parse_snippet('mc', '--[[\n$0\n]]--'),
  },
}
