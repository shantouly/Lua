--[[
    Ԫ��ĸ��
                �κα������������Ϊ��һ���������Ԫ��
                �κα�������������Լ���Ԫ���ְ֣�
                �������ӱ��н���һЩ�ض��Ĳ���ʱ����ִ��Ԫ���е�����

    ����Ԫ��
                setmetatable(�ӱ�Ԫ��)
                getmetatable(�ӱ�) --- ��ȡԪ��
    
    �ض�������
                __tostring:
                __call:
                �����������
                __index:
                __newindex:

    raw:
                rawset:
                rawget:

]]

-- �ض����� --- __tostring = function() ...... end
meta = {
    __tostring =  function (t)
        return t.name
    end
}
meta1 = {
    name = "ly"
}

setmetatable(meta1,meta)
print(meta1)

-- �ض����� --- __call = function() ... end
-- __call���ǿ��Դ��ݲ����ģ����ǣ����ݵĵ�һ������Ĭ��Ϊ��������ӱ��ڶ���֮��Ĳ�����ʵ�ʵĲ���
meta2 = {

    __tostring = function ()
        return "hello"
    end,

    __call = function (a,b)
        print(a)
        print(b)
        print("aiaiiaiaiaiai")
    end
}

myTable2 = {}

setmetatable(myTable2,meta2)
myTable2(1)

-- �����������
meta3 = {
    __add = function (t1,t2)
        return t1.age + t2.age
    end,

    __sub = function (t1,t2)
        return t1.age - t2.age
    end,

    __mul = function (t1,t2)
        return t1.age * t2.age
    end,

    __div = function (t1,t2)
        return t2.age / t1.age
    end,

    __mod = function (t1,t2)
        return t2.age % t1.age
    end,

    -- ����
    __eq = function (t1,t2)
        return 0
    end,

    --�����<
    __lt = function (t1,t2)
        return 0
    end,

    -- ����� <=
    __le = function (t1,t2)
        return 0
    end,

    -- ����� .. 
    __concat = function (t1,t2)
        return 0
    end
}

myTable3 = {
    age = 1
}
myTable3Plus = {
    age = 2
}
setmetatable(myTable3,meta3)
print(myTable3 + myTable3Plus)

-- __idnex and __newindex
-- index ���ӱ����Ҳ���ĳһ������ʱ���ᵽԪ����__indexָ���ı���ȥ��
meta6 = {
    age = 1
}
meta6.__index = {age = 2}
myTable6 = {}
setmetatable(myTable6,meta6)
print(myTable6.age)

-- newindex ����ֵʱ�������ֵһ�������ڵ�����ʱ����ô������ֵ��ֵ��newindex��ָ�ı��У�������ӵ��Լ�����
meta7 = {}
meta7.__newindex = {}
myTable7 = {}
setmetatable(myTable7,meta7)
myTable7.age = 1
print(myTable7.age)

