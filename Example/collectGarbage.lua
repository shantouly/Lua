-- ��������

test = {id = 1, name = "123123"}
-- �������չؼ���
-- collectgarbage
-- ��ȡ��ǰluaռ���ڴ��� k�ֽ� �÷���ֵ*1024 �Ϳ��Եõ�������ڴ�ռ���ֽ���
print(collectgarbage("count"))
test = nil
collectgarbage("collect")
print(collectgarbage("count"))