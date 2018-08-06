--[[
    --获取环境变量 
    skynet.getenv(varName) 
    --设置环境变量，不能设置已经存的环境变量 
    skynet.setenv(varName, varValue)

    1、预先加载的环境变量是在conﬁg中配置的，加载完成后，所有的service都能去获取这些变量。 
    2、也可以去设置环境变量，但是不能修改已经存在的环境变量。 
    3、环境变量设置完成后，当前节点上的所有服务都能访问的到。 
    4、环境变量设置完成后，即使服务退出了，环境变量依然存在，所以不要滥用环境变量。
    5、环境变量只能新增，不能修改。
]]
local skynet = require "skynet"
local log = skynet.error
local start = skynet.start
local getenv = skynet.getenv
local setenv = skynet.setenv

start(function() 
    log("start 2_env service...")
    -- 获取已经存在的环境变量
    local p_root = getenv("p_root")
    log("[env] p_root=", p_root)
    local p_luaservice = getenv("p_luaservice")
    log("[env] p_luaservice=", p_luaservice)
    -- 设置已经存在的环境变量（会报错）
    -- setenv("harbor", 2)
    -- 设置新的环境变量
    setenv("admin", "lgf")
    local admin = getenv("admin")
    log("[env] admin=", admin)
    -- 同样的，新设置的环境变量也是不能修改的
    -- setenv("admin", "jon")
    -- 其他服务也是可以获取到新设置的环境变量的

    log("end 2_env service...")
    skynet.exit()
end)