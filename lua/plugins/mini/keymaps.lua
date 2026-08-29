local keymap = require("core.keymap")
local extra = require("mini.extra")

keymap.set("n", "<Leader>gh", MiniDiff.toggle_overlay, {
  desc = "Toggle Git Diff Overlay",
})

keymap.set("n", "<Leader>nh", MiniNotify.show_history, {
  desc = "Notification History",
})

keymap.set("n", "<Leader>ff", MiniPick.builtin.files, {
  desc = "Find Files",
})

keymap.set("n", "<Leader>fg", MiniPick.builtin.grep_live, {
  desc = "Live Grep",
})

keymap.set("n", "<Leader>fd", extra.pickers.diagnostic, {
  desc = "Diagnostics",
})

keymap.set("n", "<Leader>fc", extra.pickers.commands, {
  desc = "Commands",
})

keymap.set("n", "<Leader>km", extra.pickers.keymaps, {
  desc = "Keymaps",
})

local map_multistep = require("mini.keymap").map_multistep

map_multistep("i", "<Tab>", {
  "minisnippets_next",
  "minisnippets_expand",
  "pmenu_next",
})

map_multistep("i", "<S-Tab>", {
  "minisnippets_prev",
  "pmenu_prev",
})
