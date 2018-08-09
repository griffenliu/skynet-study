--[[
    随机时间回应消息
    协程回应消息
]]

local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error

skynet.start(function() 
    skynet.register(".response")
    skynet.dispatch("lua", function(session, address, msg) 
        skynet.sleep(math.random(100, 500))
        --log("session=", session, ", address=", skynet.address(address), ", message=", msg)
        local response = skynet.response(skynet.pack)
        skynet.fork(function() 
            response(true, msg:upper())
            --log("......................")
        end)
    end)
end)