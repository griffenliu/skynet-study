local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error
local start = skynet.start
local address = skynet.address
local exit = skynet.exit
local regname = skynet.register
local localname = skynet.localname

start(function()
    log("给自己起一个别名...")
    regname(".myselfaliasname")
    local h = localname(".myselfaliasname")
    log("自己起的别名：", address(h))
end)