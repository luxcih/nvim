local command = require("core.command")

-- Theme management
command.create("Theme", function(opts)
  local theme = require("core.theme")

  if opts.args == "" then
    theme.pick()
    return
  end

  theme.set(opts.args)
end, {
  nargs = "?",
  complete = "color",
  desc = "Pick or set colorscheme",
})
