--[[

]]
local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error
local start = skynet.start
local pack = skynet.pack
local rawpack = skynet.rawpack
local unpack = skynet.unpack

start(function()
    local msg, sz = pack("大方鸭", 100, true)
    log("打包结果 = msg:", msg, "sz:", sz)
    local name, age, over = unpack(msg, sz)
    log("解包结果 = name:", name, "age:", age, "over:", over)
    -- 获取解包表
    local args = {unpack(msg, sz)}
    log("开始循环输出解包结果：")
    for i, v in pairs(args) do
        log("arg["..i.."]:", v)
    end
    -- 没有发送到其他服务，不会被自动释放，需要手动释放一下
    skynet.trash(msg,sz)
end)