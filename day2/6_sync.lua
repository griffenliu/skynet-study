--[[
    同一个服务之间的线程可以通过， skynet.wait 以及 skynet.wakeup 来同步线程
    需要注意的是：skynet.wakeup除了能唤醒wait线程，也可以唤醒sleep的线程
]]

local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local wait = skynet.wait
local wakeup = skynet.wakeup
local fork = skynet.fork

local cos = {}

function task1()
    log("task1 begin task")
    log("task1 start wait")
    wait() --等待唤醒
    log("task1 wakeup and end task")
end

function task2()
    log("task2 begin task")
    log("task2 start wakeup task1")
    wakeup(cos[1])
    log("task2 end task")
end

start(function()
    cos[1] = fork(task1)
    cos[2] = fork(task2)
end)