-- �������ʵ��

-- ��װ
Object = {}
-- ʵ��������
function Object:new()
    local obj = {}
    -- ���ն�������Ԫ�� �Լ� _index
    self.__index = self
    setmetatable(obj,self)
    return obj
end

-- �̳�
function Object:SubClass(className)
    -- ������������һ�ű� ����һ����
    _G[className] = {}
    local obj = _G[className]
    -- �����Լ��ġ����ࡱ
    obj.base = self
    -- ����������Ԫ�� �Լ�_index
    self.__index = self
    setmetatable(obj,self)
end

-- ����һ���µ���
Object:SubClass("GameObject")
-- ��Ա����
GameObject.posX = 0
GameObject.posY = 0

-- ��Ա����
function GameObject:Move()
    self.posX = self.posX + 1
    self.posY = self.posY + 1
end

-- ʵ��������ʹ��
local obj = GameObject:new()
print(obj.posX)
obj:Move()
obj:Move()
print(obj.posX)
obj:Move()

local obj1 = GameObject:new()
print(obj1.posX)
obj1:Move()
print(obj1.posX)

-- ����һ���µ��� Player �̳� GameObject
GameObject:SubClass("Player")
-- ��̬ ��д�� GameObject��Move����
function Player:Move()
    self.base.Move(self)
end

-- ʵ����Player����
print("------------------------------------")
local p1 = Player:new()
print(p1.posX)
p1:Move()
print(p1.posX)

local p2 = Player:new()
print(p2.posX)
p2:Move()
print(p2.posX)