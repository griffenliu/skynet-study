local skynet = require "skynet"
require "skynet.manager"
local inspect = require("inspect")
local log = skynet.error

local db = {}
local command = {}
command.SET = function(name, val)
    db[name] = val
end
command.GET = function(name)
    return db[name]
end

skynet.start(function()
    skynet.register(".realdb")
    skynet.dispatch("lua", function(session, address, cmd, ...)
        log(">>> realdb receive command["..cmd.."]", inspect({...}), " from", skynet.address(address))
        local f = command[cmd:upper()]
        if f then
            skynet.retpack(f(...))
        else
            log("unknown command[", cmd, "]")
        end
    end)
end)