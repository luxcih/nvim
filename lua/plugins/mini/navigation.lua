local ui = require("core.ui")

require("mini.jump").setup()
require("mini.jump2d").setup()

require("mini.pick").setup({
  window = {
    config = ui.centered_float,
  },
})
