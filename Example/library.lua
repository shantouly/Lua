-- lua�е��Դ���

-- time.ϵͳʱ��
print(os.time())
-- os.time��һ����
-- �Լ�������������Եõ���ǰ��ʱ���
print(os.time({year = 2024,month = 9,day = 24}))

-- os.date("*t") --> �����������һ��������װ����ݣ��·ݣ����ڣ����ӣ���
local nowtime = os.date("*t")
for key, value in pairs(nowtime) do
    print(key,value)
end

print(nowtime.hour)

-- ��ѧ����
-- ����ֵ
print(math.abs(-11))
-- ����ת���ɽǶ� --> ����ֵ�Ǹ�����
print(math.deg(math.pi))
-- ���Ǻ��� ������ --> ����ֵ�Ǹ�����
print(math.cos(math.pi))
-- С�����룬�ֳ��������ֺ�С������
print(math.modf(1.1))
-- ������ --> �Ѿ�������
print(math.pow(2,4))

-- �����
-- ���������������
--math.randomseed(os.time())
print(math.random(100))
print(math.random(100))

-- ���� --> ���ص��Ǹ�����
print(math.sqrt(4))

-- ·��
-- lua�ű�����·��
print(package.path)
-- �����Զ�������޸�
package.path = package.path .. ";C:\\"
print(package.path)