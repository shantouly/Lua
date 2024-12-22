function F4()
    return "123",true
end
-- 函数可以有多个返回值，而且，可以有比返回值少的变量来接受它，是不会报错的
temp1,temp2 = F4()
print(temp1,temp2)

-- 函数中的参数可以有多个，而且，调用函数的时候时可以给少于参数的个数进行传参的，这样不会报错
function F1(a,b,c)
    
    print("a:",a,"b:",b,"c:",c)
end
F1(1,2)

-- 函数类型
F2 = function()
    print("nihao")
end
print(type(F2))

-- 函数的重载：在lua中，函数是没有重载的，毕竟传递的参数可以不固定,如果有多个函数，则以最后一个函数为准

function F3(a,b)
    return a+b
end

print(F3(1,2))

-- 变长参数
function F6( ... )
    arg = {...} -- 类似数组，在lua中是一个表
    for i = 1, #arg, 1 do
        print(arg[i])
    end
end

F6(1,"2s",3,4,5,6)

-- 函数嵌套 在函数中再添加一个函数，也可以直接return这个函数，因为function本身就是一个变量。
-- 
function F8()
    return function()
        print(123);
    end
end

F8()()

-- lua中函数的闭包,改变外部函数参数中的一个生命周期
function F9(x)
    return function(y)
        return x+y
    end
end

print(F9(10)(2))

--[[
    函数：
    两种申明方式：一个在function后面取名字；一个不取名字，用一个变量来存储的
    函数传参时：个数传多了或者传少了都不会报错；多了会进行丢弃，少了会补空
    函数返回值：可以有多个返回值；外部用多个变量来接取，接少接多都不影响；少了就丢弃；多了就补空
    函数的类型：function
    lua中不支持函数的重载
    lua中的变长参数： -> ... 来声明，先用表接然后再使用
    函数的嵌套：就是函数里面声明函数；闭包：改变了变量的生命周期
]]