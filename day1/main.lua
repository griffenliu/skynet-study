local skynet = require("skynet")
local log = skynet.error
local start = skynet.start
local service = skynet.newservice

start(function() 
    -- console是一个特殊的内置服务， 可以允许你在命令行中输入服务名来启动服务
    service("console")
    skynet.exit()
end)