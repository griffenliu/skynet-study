--[[协议转换， 不解包的代理服务]]

local skynet = require 'skynet'
require "skynet.manager"
local inspect = require "inspect"
local log = skynet.error

skynet.register_protocol {
    name = "system",
    id = skynet.PTYPE_SYSTEM,
    unpack = function(...) return ... end,
}

-- forward即完成了消息的转换，同时也避免了消息C指针的释放！
local forward_map = {
    [skynet.PTYPE_LUA] = skynet.PTYPE_SYSTEM,
    -- 避免返回后响应内容被释放
    [skynet.PTYPE_RESPONSE] = skynet.PTYPE_RESPONSE 
}

skynet.forward_type(forward_map, function() 
    skynet.register(".proxy")
    skynet.dispatch("system", function(session, address, msg, sz)
        log(">> proxy receive message[", msg, ",", sz, "]from", skynet.address(address))
        skynet.ret(skynet.rawcall(".realdb", "lua", msg, sz))
    end)
end)