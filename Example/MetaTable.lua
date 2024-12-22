--[[
    元表的概念：
                任何表变量都可以作为另一个表变量的元表
                任何表变量都可以有自己的元表（爸爸）
                当我们子表中进行一些特定的操作时，会执行元表中的内容

    设置元表：
                setmetatable(子表，元表)
                getmetatable(子表) --- 获取元表
    
    特定操作：
                __tostring:
                __call:
                运算符的重载
                __index:
                __newindex:

    raw:
                rawset:
                rawget:

]]

-- 特定操作 --- __tostring = function() ...... end
meta = {
    __tostring =  function (t)
        return t.name
    end
}
meta1 = {
    name = "ly"
}

setmetatable(meta1,meta)
print(meta1)

-- 特定操作 --- __call = function() ... end
-- __call中是可以传递参数的，但是，传递的第一个参数默认为本身这个子表。第二个之后的才是你实际的参数
meta2 = {

    __tostring = function ()
        return "hello"
    end,

    __call = function (a,b)
        print(a)
        print(b)
        print("aiaiiaiaiaiai")
    end
}

myTable2 = {}

setmetatable(myTable2,meta2)
myTable2(1)

-- 运算符的重载
meta3 = {
    __add = function (t1,t2)
        return t1.age + t2.age
    end,

    __sub = function (t1,t2)
        return t1.age - t2.age
    end,

    __mul = function (t1,t2)
        return t1.age * t2.age
    end,

    __div = function (t1,t2)
        return t2.age / t1.age
    end,

    __mod = function (t1,t2)
        return t2.age % t1.age
    end,

    -- 等于
    __eq = function (t1,t2)
        return 0
    end,

    --运算符<
    __lt = function (t1,t2)
        return 0
    end,

    -- 运算符 <=
    __le = function (t1,t2)
        return 0
    end,

    -- 运算符 .. 
    __concat = function (t1,t2)
        return 0
    end
}

myTable3 = {
    age = 1
}
myTable3Plus = {
    age = 2
}
setmetatable(myTable3,meta3)
print(myTable3 + myTable3Plus)

-- __idnex and __newindex
-- index 当子表中找不到某一个属性时，会到元表中__index指定的表中去找
meta6 = {
    age = 1
}
meta6.__index = {age = 2}
myTable6 = {}
setmetatable(myTable6,meta6)
print(myTable6.age)

-- newindex 当赋值时，如果赋值一个不存在的索引时，那么会把这个值赋值到newindex所指的表中，不会添加到自己当中
meta7 = {}
meta7.__newindex = {}
myTable7 = {}
setmetatable(myTable7,meta7)
myTable7.age = 1
print(myTable7.age)

