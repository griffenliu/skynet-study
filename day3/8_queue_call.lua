local skynet = require "skynet"
local log = skynet.error

local function task(name, val)
    local r = skynet.send(".mydb", "lua", "set", name, val)
    log("set mydb["..name.."="..val.."],", "result=", r)
    r = skynet.call(".mydb", "lua", "get", name)
    log("get mydb["..name.."],", "result=", r)
end

skynet.start(function()
    skynet.fork(task, "name", "ming")
    skynet.sleep(200)
    skynet.fork(task, "name", "hong")
end)