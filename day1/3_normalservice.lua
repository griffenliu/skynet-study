--[[
    每调用一次创建接口就会创建出一个对应的服务实例，可以同时创建成千上万个，用唯一的id来区分每个服务实 例。使用的创建接口是：
    
    skynet.newservice(luaServerName, ...)

    1. 用于启动一个新的 Lua 服务,luaServerName是脚本的名字（不用写 .lua 后缀）。 
    2. 只有被启动的脚本的 start 函数返回后，这个 API 才会返回启动的服务的地址，这是一个阻塞 API 。 
    3. 如果被启动的脚本在初始化环节抛出异常,skynet.newservice 也会执行失败。 
    4. 如果被启动的脚本的 start 函数是一个永不结束的循环，那么 newservice 也会被永远阻塞住。
    
]]

local skynet = require "skynet"
local log = skynet.error
local service = skynet.newservice

skynet.start(function() 
    local handle = service("3_newservice")
    local name = skynet.address(handle)
    skynet.exit()
end)