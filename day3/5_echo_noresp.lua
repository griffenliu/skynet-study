--[[
    不响应消息
]]
local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error

skynet.start(function()
    skynet.register(".noresponse")
    skynet.dispatch("lua", function(session, address, ...)
        log("receive message from", skynet.address(address))
        skynet.exit()
    end)
end)