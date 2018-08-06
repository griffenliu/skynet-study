--[[
    服务分为两种：
    - 本地别名：只能再skynet当前节点使用， 本地别名必须使用"."开头，例如：.testalias
    - 全局别名：可以在所有skynet节点中使用， 全局别名不能以"."开头， 例如：testalias

    别名注册接口：
    local skynet = require "skynet"
    require "skynet.manager"   -- 必须引入skynet.manager
    
    --给当前服务定一个别名，可以是全局别名，也可以是本地别名 
    skynet.register(aliasname) 
    --给指定servicehandler的服务定一个别名，可以是全局别名，也可以是本地别名 
    skynet.name(aliasname, servicehandler)
]]