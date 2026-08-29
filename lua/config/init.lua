require("vim._core.ui2").enable()

-- Foundation
require("config.globals")
require("config.options")

-- Plugins
require("plugins")

-- Core systems
require("core.theme").init()

-- Configuration
require("config.keymaps")
require("config.autocmds")
require("config.commands")

-- Language support
require("lsp")
