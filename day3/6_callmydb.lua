local skynet = require "skynet"
local log = skynet.error

skynet.start(function()
    local r = skynet.send(".mydb", "lua", "set", "key1", "value1")
    log("mydb set result=" ,r)
    r = skynet.call(".mydb", "lua", "get", "key1")
    log("mydb get result=", r)
    skynet.exit()
end)