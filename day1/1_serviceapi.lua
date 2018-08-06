--[[
    local skynet = require "skynet" 
    --打印函数 
    skynet.error(...) 
    --启动和初始化： 用 func 函数初始化服务，并将消息处理函数注册到 C 层，让该服务可以工作。 
    skynet.start(func) 
    --若服务尚未初始化完成，则注册一个函数等服务初始化阶段再执行；若服务已经初始化完成，则立刻运行该函数。 
    --init函数在start函数之前运行。
    skynet.init(func) 
    --结束当前服务 
    skynet.exit() 
    --获取当前服务的句柄handler 
    skynet.self() 
    --将handle转换成字符串 
    skynet.address(handler)
    --退出skynet进程 
    require "skynet.manager" 
    --除了需要引入skynet包以外还要再引入skynet.manager包。 
    skynet.abort() 
    --强制杀死其他服务 
    skynet.kill(address) --可以用来强制关闭别的服务。但强烈不推荐这样做。因为对象会在任意一条消息处理完毕 后，毫无征兆的退出。所以推荐的做法是，发送一条消息，让对方自己善后以及调用 skynet.exit 。注： skynet.kill(skynet.self()) 不完全等价于 skynet.exit() ，后者更安全。
]]



local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local init = skynet.init
local exit = skynet.exit
local address = skynet.address


init(function() 
    log("init 1_serviceapi...")
end)

start(function() 
    log("start 1_serviceapi...")
    local handle = skynet.self()
    log("number handle=", handle)
    local name = address(handle)
    log("string handle=", name)
    exit()
end)


