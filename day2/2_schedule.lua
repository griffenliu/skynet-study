--[[
    服务调度
    local skynet = require "skynet" 
    --让当前的任务等待 time * 0.01s 。 
    skynet.sleep(time) 
    --启动一个新的任务去执行函数 func , 其实就是开了一个协程，函数调用完成将返回线程句柄 
    --虽然你也可以使用原生的coroutine.create来创建协程，但是会打乱skynet的工作流程 
    skynet.fork(func, ...) 
    --让出当前的任务执行流程，使本服务内其它任务有机会执行，随后会继续运行。 
    skynet.yield() 
    --让出当前的任务执行流程，直到用 wakeup 唤醒它。 
    skynet.wait() 
    --唤醒用 wait 或 sleep 处于等待状态的任务。 
    skynet.wakeup(co) 
    --设定一个定时触发函数 func ，在 time * 0.01s 后触发。 
    skynet.timeout(time, func) 
    --返回当前进程的启动 UTC 时间（秒）。 
    skynet.starttime() 
    --返回当前进程启动后经过的时间 (0.01 秒) 。 
    skynet.now() 
    --通过 starttime 和 now 计算出当前 UTC 时间（秒）。 
    skynet.time()

    注意： 在 skynet.start 函数中的服务初始化代码不允许有阻塞函数的存在，服务的初始化 要求尽量快的执行完成，所有的业务逻辑代码不会写在 skynet.start 里面。
]]
local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local sleep = skynet.sleep

start(function()
    log("sleep begin...")
    sleep(500)
    log("sleep end...")
end)