--[[
    skynet中的每一个服务都有一个独立的lua虚拟机，逻辑上服务之间是相互隔离的，那么你就不能使用传统意义上 的LUA全局变量来进行服务间通信了。
]]

local skynet = require("skynet")
local log = skynet.error
local start = skynet.start
local service = skynet.newservice
local exit = skynet.exit

start(function()
    service("console")
    exit()    
end)