-- 垃圾回收

test = {id = 1, name = "123123"}
-- 垃圾回收关键字
-- collectgarbage
-- 获取当前lua占用内存数 k字节 用返回值*1024 就可以得到具体的内存占用字节数
print(collectgarbage("count"))
test = nil
collectgarbage("collect")
print(collectgarbage("count"))