local skynet = require "skynet"
local log = skynet.error
local key, val = ...
-- 测试方式1
local function task()
    local r = skynet.send(".mydb", "lua", "set", key, val)
    log("set db result=", r)

    r = skynet.call(".mydb", "lua", "get", key)
    log("get db result=", r)
    skynet.exit()
end
-- 测试方式2
local function task2(key, val)
    local r = skynet.send(".mydb", "lua", "set", key, val)
    log("set db result=", r)

    r = skynet.call(".mydb", "lua", "get", key)
    log("get db result=", r)
end


-- 运行方法： 启动db服务后，连续启动两次该服务进行重入测试
skynet.start(function() 
    -- skynet.fork(task)
    skynet.fork(task2, "name", "xiaoming")
    skynet.sleep(200) --休眠2秒
    skynet.fork(task2, "name", "xiaohong")
end)