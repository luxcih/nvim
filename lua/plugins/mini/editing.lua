require("mini.comment").setup()
require("mini.completion").setup()

require("mini.indentscope").setup({
  draw = {
    animation = require("mini.indentscope").gen_animation.none(),
  },
})

require("mini.move").setup()
require("mini.pairs").setup()

require("mini.snippets").setup({
  snippets = {
    require("mini.snippets").gen_loader.from_lang(),
  },
})

require("mini.surround").setup()
