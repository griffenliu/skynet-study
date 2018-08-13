local skynet = require "skynet"
local log = skynet.error
require "systemproto"


skynet.start(function()
    local r = skynet.call(".newmsgecho", "system", "这里时一个系统消息")
    log("接收到响应结果：", r)
end)