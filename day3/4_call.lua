--[[
    随机发送消息
]]
local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error

local function task(id)
    for i=1,5 do
        local r = skynet.call(".response", "lua", "task"..id)
        log("task"..id, "call return value:", r)
    end
end

skynet.start(function()
    skynet.fork(task, 1)
    skynet.fork(task, 2)
end)
