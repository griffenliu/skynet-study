local skynet = require("skynet")
local log = skynet.error
local start = skynet.start
local service = skynet.newservice
local exit = skynet.exit

start(function()
    service("console")
    exit()    
end)