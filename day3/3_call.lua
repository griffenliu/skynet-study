local skynet = require "skynet"
require "skynet.manager"

local log = skynet.error

skynet.start(function()
    log("发送需要响应的消息...")
    local r = skynet.call(".echo", "lua", "需要回应消息", 1)
    log(r)

    local msg,sz = skynet.rawcall(".echo", "lua", skynet.pack("需要回应消息", 2))
    log(skynet.unpack(msg,sz))
end)