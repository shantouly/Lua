### Table -- Lua中一种十分关键的数据结构。Lua中的数组、二维数组、字典、类、结构体等等都是用table来进行实现  
#### 数组与二维数组：  
    1:)直接获取长度的方法为#  
    2:)Lua中的数组和二维数组的索引是从1开始的。  
    3:)Lua中数组末尾的元素为nil时，计算长度不会加进去；在低版本的Lua中，数组中元素为nil时，会直接截断，只计算nil前面的长度（这个在更高级的Lua版本已经修改了，还是将这个nil计算到数组的长度中)  
    4:)Lua中的数组是支持自定义索引的，但是，在获取长度的时候会有错误。在使用#直接获取长度的时候，小于等于0的索引会直接剔除。  
      tips：当自定义索引中索引跳过了超过两个以上的话，会把当前及其之后的索引给剔除，最多间隔1  
          :c = {[1] = 1,[2] = 2,[4] = 3}  
    5:)数组的遍历  
      for i = 1, #a, 1 do  
        print(a[i])  
      end  
      二维数组：  
      -- 二维数组的遍历，这里如果不声明b的话，那么b应该就是一个全局变量,print(b)加上了local之后打印出来的为nil  
      for i = 1, #aa, 1 do
          local b = aa[i]
          for j = 1, #b, 1 do
              print(b[j])
          end
      end  
#### iparis和paris  
    iparis -- 不能找到0和0以下的自定义索引的内容，如果从1开始 索引不是连续的话，后面的内容也会找不到  
    pairs -- 建议用来遍历各种不规则的表，它可以得到所有信息  
      
    用iparis遍历数组：  
    a = {1,2,3,4,5}  
    for i,k in ipairs(a)do  
        print(i.."_"..k)  
    end  
    -- 用paris遍历自定义索引会把所有的键值遍历出来，不管是不是小于等于0  
    for i,k in pairs(a) do  
        print(i.."_"..k)  
    end  

    用paris遍历字典：  
    a = {["name"] = "Ly",["age"] = 14,["1"] = 1}  
    -- 使用paris  
    for _,k in pairs(a) do  
        print(_, k)  
    end  
#### Function  
    两种申明方式：一个在Fcuntion后面取名字；一个不去名字，用一个变量来存储  
    1:) function func()  
    ....  
    end  
    2:) f1 = function ()  
        ...  
        end  
    函数的传参：个数传多了或者传少了都不会报错；多了会进行丢弃，少了则会补空  
    函数的返回值：可以有多个返回值；外部用多个变量来接取，接少接多都不影响；少了就丢弃；多了就补空  
    函数的type：Function  
    lua中不支持函数的重载  
    lua中的边长参数： -> ... 来申明，先用表接然后再进行使用  
    函数的嵌套：就是函数里面申明函数；闭包，改变了变量的生命周期  
#### lua中封装  
     封装:
        表就是表现类的一种形式  
        实现了new方法本质上是创建了一个空表，设置了一个元表，使用__index来指向自己  
        修改创建出来的对象的属性变量时，返回出来的空表对象新建了一个成员属性（变量）  
        冒号：self代表函数调用者，表里面要有对应的self函数才行，普通函数是不能这样调用的  
        Object = {}  
        function Object:new()  
            local obj = {}  
            self.__index = self  
            setmetatable(obj,self)  
            return obj  
        end  
#### lua中的继承  
    function Object:subClass(className)  
        _G[className] = {}  
        local obj = _G[className]  
        obj.base = self  
        self.__index = self  
        setmetatable(obj,self)  
    end  
#### lua中的多态  
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
    
      
      
