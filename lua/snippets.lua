local ls = require "luasnip"
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.choice_active() then
    ls.choice_active(1)
  end
end, { silent = true })

-- source snippets.lua
local srcmd = "nvim/lua/snippets.lua<CR>"
local os = vim.loop.os_uname().sysname

if os == "Linux" then
  srcmd = "<cmd>source ~/.config/" .. srcmd
elseif os == "Windows_NT" then
  srcmd = "<cmd>luafile $LOCALAPPDATA/" .. srcmd
end
vim.keymap.set("n", "<leader>ss", srcmd)

ls.add_snippets("all", {
  s("cb", fmt([[
  {{
    {}
  }}
  ]], { i(0) })),
  s("bb", fmt([[
  [
    {}
  ]
  ]], { i(0) })),
  s("pb", fmt([[
  (
    {}
  )
  ]], { i(0) })),

  s("wb", fmt([[
  {{
    {}
  }})
  ]], { i(0) })),
})

ls.filetype_extend("all", { "html" })

ls.add_snippets("scss", {
  s("c", fmt([[
    .{} {{
      {}
    }}
  ]], { i(1), i(0) })),
  s("m", fmt([[
    @media screen and (min-width: {}) {{
      {}
    }}
  ]], { i(1), i(0) })),
  s("x", fmt([[
    @extend .{};
  ]], { i(0) })),
})

ls.filetype_extend("css", { "scss" })

ls.add_snippets("go", {
  s("ie", fmt([[
  if err != nil {{
    {}
  }}
  ]], { i(0) })),
})

ls.add_snippets("javascript", {
  s("f", fmt([[
    for (let i = 0; i < {}.length; i++) {{
      {}
    }}
  ]], { i(1), i(0) })),
  s("nn", fmt([[
    if ({} !== null && {} !== undefined && {} !== void 0) {{
      {}
    }}
  ]], { i(1), rep(1), rep(1), i(0) })),
  s("in", fmt([[
    if ({} === null || {} === undefined || {} === void 0) {{
      {}
    }}
  ]], { i(1), rep(1), rep(1), i(0) })),
  s("rfc", fmt([[
    export default function {}() {{
      return <{}>{}</{}>
    }}
  ]], { i(1), i(2), i(0), rep(2) }))
})

ls.filetype_extend("typescript", { "javascript" });
ls.filetype_extend("typescriptreact", { "javascript" });

ls.add_snippets("html", {
  s("doc", fmt([[
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{}</title>
      </head>
      <body>
        {}
      </body>
    </html>
  ]], { i(1), i(0) })),
  s("be", fmt([[
    <{}{}>
      {}
    </{}>
  ]], { i(1), i(2), i(0), rep(1) })),
  s("ie", fmt([[
    <{}{}>{}</{}>
  ]], { i(1), i(2), i(0), rep(1) }))
})

ls.filetype_extend("svelte", { "scss", "html", "javascript" });
