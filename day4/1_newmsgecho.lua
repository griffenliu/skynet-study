local skynet = require "skynet"
require "skynet.manager"
require "systemproto"

-- skynet.register_protocol {
--     name = "system",
--     id = skynet.PTYPE_SYSTEM,
--     pack = skynet.pack,
--     unpack = skynet.unpack,
-- }

skynet.start(function()
    skynet.register(".newmsgecho")
    skynet.dispatch("system", function(session, address, ...)
        skynet.retpack(...)
    end)
end)