-- ipairs
a = {1,2,3,4,5}
-- 用iparis遍历数组
for i,k in ipairs(a)do
    print(i.."_"..k)
end

-- 用iparis遍历自定义索引和用#获取的长度是一样的，只能遍历连续的索引，并且小于等于0是不会被遍历出来的
a = {[-1] = -1,[1] = 1,[2] = 2,[3] = 3,[5] = 5,[-2] = -2}
for i,k in ipairs(a) do
    print(i.."_"..k)
end
print("=============================")

-- 用paris遍历自定义索引会把所有的键值遍历出来，不管是不是小于等于0
for i,k in pairs(a) do
    print(i.."_"..k)
end

--[[
    iparis -- 不能找到0和0一下的自定义索引的内容，如果从1开始 索引不是连续的话，后面的内容也会找不到
    pairs -- 建议用来遍历各种不规则的表，它可以得到所有信息
    遍历方式：
    for i,k in iparis/paris do
        ......
    end
]]