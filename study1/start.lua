local skynet = require "skynet"
require "skynet.manager"

local log = skynet.error
local address = skynet.address
local start  = skynet.start
local service = skynet.newservice
local alias = skynet.name
local name = skynet.localname
local exit = skynet.exit
local sleep = skynet.sleep

local args = {...}

start(function()
    -- 参数获取示例
    for _, v in ipairs(args) do
        log(v, ", ", type(v))
    end
    -- 别名示例
    local handle = service("test1", "param1", "123", "false") 
    alias(".testalias", handle)
    local aname = address(name("testalias"))
    log(aname)
    -- sleep示例
    log("开始休眠...")
    sleep(500)
    log("已休眠5秒...")
    exit()
end)
