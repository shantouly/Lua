-- lua中的自带库

-- time.系统时间
print(os.time())
-- os.time是一个表
-- 自己传入参数，可以得到当前的时间戳
print(os.time({year = 2024,month = 9,day = 24}))

-- os.date("*t") --> 这个本质上是一个表，里面装了年份，月份，日期，分钟，秒
local nowtime = os.date("*t")
for key, value in pairs(nowtime) do
    print(key,value)
end

print(nowtime.hour)

-- 数学运算
-- 绝对值
print(math.abs(-11))
-- 弧度转换成角度 --> 返回值是浮点数
print(math.deg(math.pi))
-- 三角函数 传弧度 --> 返回值是浮点数
print(math.cos(math.pi))
-- 小数分离，分成整数部分和小数部分
print(math.modf(1.1))
-- 幂运算 --> 已经被废弃
print(math.pow(2,4))

-- 随机数
-- 先设置随机数种子
--math.randomseed(os.time())
print(math.random(100))
print(math.random(100))

-- 开方 --> 返回的是浮点数
print(math.sqrt(4))

-- 路径
-- lua脚本加载路径
print(package.path)
-- 还可以对其进行修改
package.path = package.path .. ";C:\\"
print(package.path)