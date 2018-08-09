--[[
    不需要应答的消息发送
]]
local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error

skynet.start(function()
    
    local r = skynet.send(".echoservice", "lua", "大房鸭", 100, false)
    log("1发送消息返回:", r)

    local r2 = skynet.rawsend(".echoservice", "lua", skynet.pack("大房鸭", 102, false))
    log("2发送消息返回:", r)

end)