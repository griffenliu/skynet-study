local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local env = skynet.getenv

local args = {...}

start(function() 
    log("start new service...")

    for _, v in ipairs(args) do
        log(v, type(v))
    end
    -- 句柄的获取核显示
    local hd = skynet.self()
    log("handle:", hd)
    local address = skynet.address(hd)
    log("address:", address)
    -- 环境变量的获取核设置
    local root = env("root")
    log("[env] root: ", root)
    skynet.exit()
end)
