local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error

skynet.start(function()
    skynet.register(".echo")
    skynet.dispatch("lua", function(session, address, ...)
        log("接收到消息来自[", skynet.address(address), "], session=", session)
        local args = {...}
        for i, v in ipairs(args) do
            log("["..i.."]="..v)
        end
        skynet.retpack("这里是回应消息:"..args[2])
    end)
end)