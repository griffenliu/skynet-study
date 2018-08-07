--[[
    在skynet的服务中我们可以开一个新的线程来处理业务（注意这个的线程并不是传统意义上的线程，更像是一个 虚拟线程，其实是通过协程来模拟的）。
    以后如果遇到需要长时间运行，并且出现阻塞情况，都要使用 skynet.fork 在创建一个新的线程(协程)。
]]

local skynet = require "skynet"
local log = skynet.error
local sleep = skynet.sleep
local start = skynet.start
local fork = skynet.fork

function task(timeout)
    log("fork co:", coroutine.running())
    log("begin sleep")
    sleep(timeout)
    log("sleep end")
end

start(function()
    log("start co:", coroutine.running())
    fork(task, 500)
    fork(task, 500)
end)