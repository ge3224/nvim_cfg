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

-- ls.parser.parse_snippet(<text>, <text snippet>)
ls.snippets = {
  all = {
  },
  scss = {
    ls.parser.parse_snippet('s', '.$1 {\n\t$0\n}'),
    ls.parser.parse_snippet('m', '\t@media screen and (min-width: $1) {\n\t\t$0\n\t}'),
  },
  html = {
    ls.parser.parse_snippet('a', '<a class="$1" href="$2">$0</a>'),
    ls.parser.parse_snippet('d', '<div class="$1">\n\t$0\n</div>'),
    ls.parser.parse_snippet('html', '<!DOCTYPE html>\n<html>\n\t<head>\n\t\t<meta charset="utf-8">\n\t\t<title>$1</title>\n\t</head>\n\t<body>\n\t</body>\n</html>'),
    ls.parser.parse_snippet('img', '<img src="$1" class="$0">'),
    ls.parser.parse_snippet('md', '{{ call . "$0" }}'),
    ls.parser.parse_snippet('srcset', '<picture class="$1">\n\t<source media="(min-width:1200px)" srcset="$2">\n\t<source media="(min-width:992px)" srcset="$3">\n\t<source media="(min-width:768px)" srcset="$4">\n\t<source media="(min-width:576px)" srcset="$5">\n\t<img src="$6" alt="$0">\n</picture>'),
  }
}
