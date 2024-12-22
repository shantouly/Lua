-- local a = require('01.Test')
-- print(a)
-- print(testA)
-- print(testLocalA)

-- print(package.loaded["Test"])

-- -- 卸载已经执行过的脚本
-- print(package.loaded["01.Test"])
-- package.loaded["01.Test"] = nil
-- print(package.loaded["01.Test"])
-- require("01.Test")
-- _G表是一个总表(table) 他将我们申明的所有全局的变量都存储再其中
-- require("01.Test")
a = require("01.Test")
for key, value in pairs(_G) do
    print(key,value)
end
