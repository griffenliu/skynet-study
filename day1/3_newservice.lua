local skynet = require "skynet"
local log = skynet.error

skynet.start(function()
    log("新的普通服务启动成功！！！")
    skynet.exit()
end)