-- lite-xl 1.16
local core = require "core"
local command = require "core.command"
local keymap = require "core.keymap"
local console = require "plugins.console"

command.add(nil, {
  ["project:run-program"] = function()
    core.log "Building..."
    console.run {
      command = "zig run $FILENAME",
      file_pattern = "(.*):(%d+):(%d+): (.*)$",
      on_complete = function() core.log "Build complete" end,
    }
  end
})

command.add(nil, {
  ["project:Build-project"] = function()
    core.log "Building..."
    console.run {
      command = "zig build",
      file_pattern = "(.*):(%d+):(%d+): (.*)$",
      on_complete = function() core.log "Build complete" end,
    }
  end
})

keymap.add { ["ctrl+r"] = "project:run-program" }
keymap.add { ["ctrl+b"] = "project:Build-project" }
