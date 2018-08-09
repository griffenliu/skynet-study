local skynet = require("skynet")
require "skynet.manager"
local log = skynet.error

local datas = {}
local cmds = {}
cmds.GET = function(name)
    return datas[name]
end
cmds.SET = function(name, value)
    datas[name] = value
end

skynet.start(function()
    skynet.register(".mydb")
    skynet.dispatch("lua", function(session, address, cmd, ...)
        cmd = cmd:upper()
        local c = cmds[cmd]
        if c then
            skynet.retpack(c(...))
        else
            log("unknow command["..cmd.."]")
        end
    end)
end)