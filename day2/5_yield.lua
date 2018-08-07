
local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local yield = skynet.yield
local fork = skynet.fork

function task(name)
    local i = 0
    log(name, "begin task")
    while(i<200000000)
    do
        i=i+1
        if i%50000000 == 0 then
            yield()
            log(name, "task yield")
        end
    end
    log(name, "end task", i)
end

start(function()
    fork(task, "task1")
    fork(task, "task2")
end)