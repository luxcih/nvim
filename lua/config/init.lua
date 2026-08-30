require("vim._core.ui2").enable()

-- Foundation
require("config.globals")
require("config.options")

-- Core systems
require("core.theme").init()

-- Plugins
require("plugins")

-- Configuration
require("config.keymaps")
require("config.autocmds")
require("config.commands")

-- Language support
require("lsp")
