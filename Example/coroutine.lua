print("协同程序")

-- 协程的创建
func = function ()
    print(123)
end
-- 协程的本质是一个线程对象
-- coroutine.create() -- 这个的返回值类型是thread
co = coroutine.create(func)
print(co)

-- Coroutine.warp() -- 这个的返回值类型是function
co2 = coroutine.wrap(func)
print(co2)

-- 协程的挂起
fun2 = function ()
    local i = 1
    while true do
        print(i)
        i = i + 1
        coroutine.yield()
    end
end

co3 = coroutine.create(fun2)
coroutine.resume(co3)
coroutine.resume(co3)
-- coroutine 中的yield也有返回值的，协程的返回值：第一个默认是true或者是false（协程是否开启成功），第二个是yield中的返回值

fun3 = function ()
    local i = 1
    while true do
        print(i)
        i = i + 1
        coroutine.yield(i)
    end
end

co4 = coroutine.create(fun3)
isOk, tempI = coroutine.resume(co4)
print(isOk,tempI)

co5 = coroutine.wrap(fun3)
Ok,tempi = co5()
-- 下面的这个返回的是2和nil，在wrap中，不返回第一个的true或者是false，只返回yield中的返回值
print(Ok,tempi)

-- 协程的状态
--[[
    coroutine.status(协程对象) --- 调用方式,参数不能是协程函数，只能是协程对象(用create创建的)
    dead --- 结束
    suspended --- 暂停
    running --- 进行中
    normal --- 活动但是没有运行
    coroutine.running() --- 可以获取当前正在进行中的协程对象

    -- 协程的执行
    co = coroutine.create(function) --> coroutine.resume(co)

    co1 = coroutine.warp(function) --> co1()
]]
print(12121212121)
print(coroutine.status(co4))