print("*************�ֵ������*************")
a = {["name"] = "Ly",["age"] = 14,["1"] = 1}

print(a["name"])
print(a["age"])
print(a.name)
print(a.age)
a["name"] = "yl"
a["age"] = nil
a["sex"] = true;
print("************�ֵ�ı���")
-- ʹ��paris
for _,k in pairs(a) do
    print(_, k)
end

print("************��ͽṹ��")

student = {
    age = 18,
    name = "ly",

    Up = function (t)
        print(t.age)
        print("����")
    end,

    Learn = function ()
        print("ѧϰ")
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
print("************��Ĺ�������")

