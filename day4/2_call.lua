local skynet = require "skynet"

local log = skynet.error

skynet.start(function()
    log("> send set command to .proxy...")
    local r = skynet.send(".proxy", "lua", "set", "name", "lgf")
    log("@ set result from .proxy:", r)

    log("> send get command to .proxy...")
    r = skynet.call(".proxy", "lua", "get", "name")
    log("@ get result from .proxy:", r)
end)