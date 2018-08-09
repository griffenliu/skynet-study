local skynet = require "skynet"
local log = skynet.error

local args = {...}

skynet.start(function() 
    log("args=", table.unpack(args))
    local r = skynet.call(".mydb", "lua", table.unpack(args))
    log("call cmd result", r)
    skynet.exit()
end)