--[[
    每个服务启动之后，都有一个整形数来表示id，也可以使用字符串id来表示，例如： :01000010 ，其实就是把 id： 0x01000010 转换成字符串。
    但是这个数字的表示方式会根据服务的启动先后顺序而变化，不是一个固定的值。如果想要方便的获取某个服务， 那么可以通过给服务设置别名。

    服务分为两种：
    - 本地别名：只能再skynet当前节点使用， 本地别名必须使用"."开头，例如：.testalias
    - 全局别名：可以在所有skynet节点中使用， 全局别名不能以"."开头， 例如：testalias

    节点的概念： 可以简单的理解为一个skynet进程就是一个节点

    别名注册接口：
    local skynet = require "skynet"
    require "skynet.manager"   -- 必须引入skynet.manager
    --给当前服务定一个别名，可以是全局别名，也可以是本地别名 
    skynet.register(aliasname) 
    --给指定servicehandler的服务定一个别名，可以是全局别名，也可以是本地别名 
    skynet.name(aliasname, servicehandler)

    别名查询接口
    --查询本地别名为aliasname的服务，返回servicehandler，不存在就返回nil; localname只能查本地别名， 不能查全局别名
    skynet.localname(aliasname)
    --查询别名为aliasname的服务,可以是全局别名也可以是本地别名， 
    --1、当查询本地别名时，返回servicehandler，不存在就返回nil 
    --2、当查询全局别名时，返回servicehandler，不存在就阻塞等待到该服务初始化完成 
    local skynet = require "skynet.harbor" 
    harbor.queryname(aliasname)

    注意：本地别名与全局别名可以同时存在。

    调用 "harbor.queryname" 查询一个不存在的全局别名将会导致阻塞，直到全局别名的服务创建成功。

    给一个服务取了别名后， 杀死它， 本地别名将会注销， 但是全局别名依然存在， 通过全局别名查询到的handle已经没有意义。如果通过查询得到的handle进行操作将会得到不可预知的问题。

    skynet的全局别名服务是在cslave里面实现的，现在不允许二次修改全局别名绑定关系，所以全局别名一般用来给 一个永远不会退出的服务来启用。

    全局唯一服名和全局别名的区别：
    1. 两个是两个概念的名词
    2. 全局唯一服名称： 用来标识服务是唯一的，服务名称一般就是脚本名称， 无法更改。
    3. 全局别名： 用来给服务起别名

]]

local skynet = require "skynet"
require "skynet.manager"

local log = skynet.error
local start = skynet.start
local exit = skynet.exit
local newservice = skynet.newservice
local address = skynet.address

local name = skynet.name
local localname = skynet.localname

start(function()
    log("测试普通服务别名...")
    local h = newservice("1_service1")
    name(".startaliasname", h)

    local h2 = localname(".startaliasname")
    log("启动器起的别名：", address(h2))

    exit()
end)