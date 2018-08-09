local skynet = require "skynet"
local log = skynet.error

local function task()
    skynet.call(".noresponse", "lua", "等待响应！")
end
skynet.start(function()
    skynet.fork(task)
end)