print("*************字典的声明*************")
a = {["name"] = "Ly",["age"] = 14,["1"] = 1}

print(a["name"])
print(a["age"])
print(a.name)
print(a.age)
a["name"] = "yl"
a["age"] = nil
a["sex"] = true;
print("************字典的遍历")
-- 使用paris
for _,k in pairs(a) do
    print(_, k)
end

print("************类和结构体")

student = {
    age = 18,
    name = "ly",

    Up = function (t)
        print(t.age)
        print("向上")
    end,

    Learn = function ()
        print("学习")
    end    
}
student.sex = "nan"

function student.speak()
    print("shuohua")
end

function student:speak1()
    print(self.age)
end

student.speak()
print(student.sex)
student.Up(student)
student:Up()
student:speak1()
print("************表的公共操作")

