-- local a = require('01.Test')
-- print(a)
-- print(testA)
-- print(testLocalA)

-- print(package.loaded["Test"])

-- -- ж���Ѿ�ִ�й��Ľű�
-- print(package.loaded["01.Test"])
-- package.loaded["01.Test"] = nil
-- print(package.loaded["01.Test"])
-- require("01.Test")
-- _G����һ���ܱ�(table) ������������������ȫ�ֵı������洢������
-- require("01.Test")
a = require("01.Test")
for key, value in pairs(_G) do
    print(key,value)
end
