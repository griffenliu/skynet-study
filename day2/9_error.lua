--[[
    lua中的错误处理都是通过assert以及error来抛异常，并且中断当前流程，skynet也不例外
    assert和error会终止当前协程， 但是不会终止服务和节点
    如果不想把协程中断掉，可以使用pcall来捕捉异常
]]

local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local sleep = skynet.sleep
local fork = skynet.fork
local corunning = coroutine.running

function task1()
    log("task1", corunning())
    sleep(100)
    assert(nil)
    --error("error occurred")
    log("task1", corunning(), "end")
end

function task2()
    log("task2", corunning())
    sleep(500)
    log("task2", corunning(), "end")
end

start(function()
    log("start", corunning())
    --fork(task1)
    --fork(task2)
    -- 使用pcall捕获异常的示例
    fork(pcall, task1)
    fork(pcall, task2)
end)