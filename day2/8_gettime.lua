--[[

]]

local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local sleep = skynet.sleep
local fork = skynet.fork
local starttime = skynet.starttime
local time = skynet.time
local now = skynet.now

function task()
    log("task")
    log("start time", starttime())
    sleep(200)
    log("time", time())
    log("now", now())
end

start(function()
    fork(task)
end)