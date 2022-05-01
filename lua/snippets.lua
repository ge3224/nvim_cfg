local ls = require"luasnip"
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
-- local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l

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

ls.add_snippets("scss", {
  s("c", {
    t({"."}), i(1, "class_name"), t(" {"),
    t({"","\t"}), i(2, "declaration"),
    t({"", "}"})
  }),
  s("m", {
    t({"@media screen and (min-width: "}), i(1, "breakpoint"), t({") {"}),
    t({"","\t"}), i(2, "declaration"),
    t({"", "}"})
  }),
  s("x", {
    t("@extend ."), i(1, "class_name"), t(";")
  })
})

ls.filetype_extend("css", { "scss" })

ls.add_snippets("javascript", {
  s("f", {
    t("for (let i = 0; i, "), i(1, "<array>"), t(".length; i++) {"),
    t({"", "\t"}), i(2, "<code block>"),
    t({"", "}"}),
  }),
  s("n", {
    t("if ("), i(1, "<object>"), t(" !== null && "), i(2, "<object>"), t(" !== undefined && "), i(3, "<object>"), t(" !== void 0) {"),
    t({"", "\t"}), i(4, "<block>"),
    t({"", "}"})
  }),
  s("nc", {
    t("if ("), i(1, "<object>"), t(" === null || "), i(2, "<object>"), t(" === undefined || "), i(3, "<object>"), t(" === void 0) {"),
    t({"", "\t"}), i(4, "<block>"),
    t({"", "}"})
  })
})

ls.filetype_extend("svelte", { "scss", "html", "javascript" });

ls.add_snippets("all", {
  s("doc", {
    t({"<!DOCTYPE html>", "<html>"}),
    t({"", "\t<head>"}),
    t({"", "\t\t<meta charset=\"utf-8\">"}),
    t({"", "\t\t<title>"}), i(1, "text..."), t({"</title>"}),
    t({"", "\t</head>"}),
    t({"", "\t<body>"}),
    t({"", "\t\t\t"}), i(2, "continue..."),
    t({"", "\t</body>"}),
    t({"", "</html>"})
  }),
  s("be", {
    t({"<"}), i(1, "tag..."), t({">"}),
    t({"", "\t"}), i(2, "content..."),
    t({"", "</"}), i(3, "tag..."), t({">"})
  }),
  s("ie", {
    t({"<"}), i(1, "tag..."), t({">"}), i(2, "content..."), t({"</"}), i(3, "tag..."), t({">"})
  })
})

ls.add_snippets("lua", {
  s("t", {
    t("t({\""), i(1, "text..."), t("\"})")
  }),
  s("i", {
    t({"i("}), i(1, "number..."), t({", \""}), i(2, "text..."), t({"\")"})
  }),
  s("s", {
    t({"s(\""}), i(1, "trigger..."), t({"\", {"}),
    t({"", "\t"}), i(2, "code_block..."),
    t({"", "})"})
  })
})

ls.add_snippets("go", {
  s("e", {
    t({"if err != nil {"}),
    t({"", "\t"}), i(1, "block..."),
    t({"", "}"})
  })
})
