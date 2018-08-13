--[[
    伪造消息服务
]]

local skynet = require "skynet"

local log = skynet.error

skynet.start(function()
    skynet.redirect(skynet.localname(".realdb"), skynet.localname(".4call"), "lua", 0, skynet.pack("set", "name", "redirect"))

    skynet.redirect(skynet.localname(".realdb"), skynet.localname(".4call"), "lua", 0, skynet.pack("get", "name"))

end)