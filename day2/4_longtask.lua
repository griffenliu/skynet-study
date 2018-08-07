--[[
    skynet.fork 创建的线程其实通过lua协程来实现的，即一个协程占用执行权后，其他的协程需要等待。
]]
local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local fork = skynet.fork

function task(name)
    local i = 0
    log(name, "begin task")
    while(i<200000000)
    do
        i = i+1
    end
    log(name, "end task", i)
end

start(function()
    fork(task, "task1")
    fork(task, "task2")
end)