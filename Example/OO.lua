print("**********封装***********")
-- 面向对象 类 其实都是基于 table来进行实现
-- 元表相关的知识点

--[[
    封装:
        表就是表现类的一种形式
        实现了new方法本质上是创建了一个空表，设置了一个元表，使用__index来指向自己
        修改创建出来的对象的属性变量时，返回出来的空表对象新建了一个成员属性（变量）
        冒号：self代表函数调用者，表里面要有对应的self函数才行，普通函数是不能这样调用的
]]
-- Object = {}
-- Object.id = 1

-- function Object:Test()
--     print(self.id)
-- end

-- -- 冒号 是会自动将调用这个函数的对象 作为第一个参数传入的写法
-- function Object:new()
--     -- self 代表的是我们默认传入的第一个参数
--     -- 对象就是变量 返回一个新的变量
--     -- 返回出去的内容 本质上就是对象
--     local obj = {}
--     -- 元表知识 __index 当找自己的变量找不到时，就会去元表当中__index指向的内容
--     self.__index = self
--     setmetatable(obj,self)
--     return obj
-- end

-- local myObj = Object:new()
-- -- 这样子的话id = 3还是没有加到myObj当中的
-- myObj.__newindex = {id = 3}
-- print(myObj.__newindex.id)
-- myObj:Test()