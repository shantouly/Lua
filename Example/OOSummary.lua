-- 面向对象实现

-- 封装
Object = {}
-- 实例化方法
function Object:new()
    local obj = {}
    -- 给空对象设置元素 以及 _index
    self.__index = self
    setmetatable(obj,self)
    return obj
end

-- 继承
function Object:SubClass(className)
    -- 根据名字生成一张表 就是一个类
    _G[className] = {}
    local obj = _G[className]
    -- 设置自己的“父类”
    obj.base = self
    -- 给子类设置元素 以及_index
    self.__index = self
    setmetatable(obj,self)
end

-- 申明一个新的类
Object:SubClass("GameObject")
-- 成员变量
GameObject.posX = 0
GameObject.posY = 0

-- 成员方法
function GameObject:Move()
    self.posX = self.posX + 1
    self.posY = self.posY + 1
end

-- 实例化对象使用
local obj = GameObject:new()
print(obj.posX)
obj:Move()
obj:Move()
print(obj.posX)
obj:Move()

local obj1 = GameObject:new()
print(obj1.posX)
obj1:Move()
print(obj1.posX)

-- 申明一个新的类 Player 继承 GameObject
GameObject:SubClass("Player")
-- 多态 重写了 GameObject的Move方法
function Player:Move()
    self.base.Move(self)
end

-- 实例化Player对象
print("------------------------------------")
local p1 = Player:new()
print(p1.posX)
p1:Move()
print(p1.posX)

local p2 = Player:new()
print(p2.posX)
p2:Move()
print(p2.posX)