local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error

skynet.start(function() 
    skynet.register(".echoservice")
    skynet.dispatch("lua", function(session, address, ...)
        log("从服务", skynet.address(address), "中接收到消息, session=", session)
        local args = {...}
        for i, v in pairs(args) do
            log("["..i.."]=", v)
        end
    end)
end)