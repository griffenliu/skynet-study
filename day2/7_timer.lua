--[[
    skynet中的定时器，其实是通过给定时器线程注册了一个超时时间，并且占用了一个空闲协程，空闲协程也是从 协程池中获取，超时后会使用空闲协程来处理超时回调函数。
]]
local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local timeout = skynet.timeout
local time_count = 0
function task()
    log("task", coroutine.running())
end
function dottask()
    print('.')
    time_count = time_count+1
    if time_count<5 then
        timeout(100, dottask)
    end
end

start(function() 
    log("start", coroutine.running())
    
    timeout(500, task) -- 5秒之后运行task函数，只是注册回调，不会阻塞
    timeout(100, dottask)
end)
