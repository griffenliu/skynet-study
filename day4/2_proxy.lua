local skynet = require "skynet"
require "skynet.manager"
local inspect = require "inspect"
local log = skynet.error

local realsvr = ".realdb"
skynet.start(function() 
    skynet.register(".proxy")
    skynet.dispatch("lua", function(session, address, ...) --注意这里会被解包
        log(">> proxy receive message[", inspect({...}), "]from", skynet.address(address))
        skynet.ret(skynet.rawcall(realsvr, "lua", skynet.pack(...))) --这里再次发送时需要再次打包， 调用rawcall可以使得返回结果可以直接使用不用再次打包
    end)
end)