print("Эͬ����")

-- Э�̵Ĵ���
func = function ()
    print(123)
end
-- Э�̵ı�����һ���̶߳���
-- coroutine.create() -- ����ķ���ֵ������thread
co = coroutine.create(func)
print(co)

-- Coroutine.warp() -- ����ķ���ֵ������function
co2 = coroutine.wrap(func)
print(co2)

-- Э�̵Ĺ���
fun2 = function ()
    local i = 1
    while true do
        print(i)
        i = i + 1
        coroutine.yield()
    end
end

co3 = coroutine.create(fun2)
coroutine.resume(co3)
coroutine.resume(co3)
-- coroutine �е�yieldҲ�з���ֵ�ģ�Э�̵ķ���ֵ����һ��Ĭ����true������false��Э���Ƿ����ɹ������ڶ�����yield�еķ���ֵ

fun3 = function ()
    local i = 1
    while true do
        print(i)
        i = i + 1
        coroutine.yield(i)
    end
end

co4 = coroutine.create(fun3)
isOk, tempI = coroutine.resume(co4)
print(isOk,tempI)

co5 = coroutine.wrap(fun3)
Ok,tempi = co5()
-- �����������ص���2��nil����wrap�У������ص�һ����true������false��ֻ����yield�еķ���ֵ
print(Ok,tempi)

-- Э�̵�״̬
--[[
    coroutine.status(Э�̶���) --- ���÷�ʽ,����������Э�̺�����ֻ����Э�̶���(��create������)
    dead --- ����
    suspended --- ��ͣ
    running --- ������
    normal --- �����û������
    coroutine.running() --- ���Ի�ȡ��ǰ���ڽ����е�Э�̶���

    -- Э�̵�ִ��
    co = coroutine.create(function) --> coroutine.resume(co)

    co1 = coroutine.warp(function) --> co1()
]]
print(12121212121)
print(coroutine.status(co4))