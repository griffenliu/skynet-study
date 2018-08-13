local skynet = require "skynet"

skynet.register_protocol{
    id = skynet.PTYPE_SYSTEM,
    name = "system",
    pack = skynet.pack,
    unpack = skynet.unpack,
}