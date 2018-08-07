--[[

]]
local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error
local start = skynet.start
local address = skynet.address
local dispatch = skynet.dispatch
local register = skynet.register

local function dosomething(session, handle, ...)
    log("session", session)
    log("address", address(handle))
    local args = {...}
    for i,v in pairs(args) do
        log("args: i="..i..", v="..v)
    end
end

start(function()
    dispatch("lua", function(session, handle, ...)
        dosomething(session, handle, ...)
    end)
    register(".testluamsg")
end)