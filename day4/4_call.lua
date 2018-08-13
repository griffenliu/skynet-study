local skynet = require "skynet"
require "skynet.manager"
local log = skynet.error

skynet.start(function()
    skynet.register(".4call")
    log("> send set command to .realdb...")
    local r = skynet.send(".realdb", "lua", "set", "name", "lgf")
    log("@ set result from .realdb:", r)

    log("> send get command to .realdb...")
    r = skynet.call(".realdb", "lua", "get", "name")
    log("@ get result from .realdb:", r)
end)