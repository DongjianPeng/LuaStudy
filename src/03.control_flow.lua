---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by DongjianPeng.
--- DateTime: 2022/6/26/0026 18:18
--- 控制流
---
print("------------------分隔线----------------")
-- if-else
x = 10
if x > 0 then
    print("x > 0") --  x > 0
else
    print("x <=0")
end

if x == 9 then
    print("x == 9")
elseif x == 10 then
    print("x == 10") -- x == 10
else
    print("x ??")
end

-- while
-- 切记:
---- 没有do-while
--- 没有continue
--- 有break
local x = 5
while x > 0 do
    if x <= 1 then
        print("break..") -- break..
        break
    end
    print("do something...") -- do something... X4
    x = x - 1
end
print(x) -- 1

-- repeat
-- 切记：功能类似do-while，但是条件为真时结束，如果until结果一直为false，会死循环
x = 3
repeat
    print("x:", x) -- x:	3   --  x:	2
    x = x - 1;
until x <= 1

-- for
---- begin开始，finish结束
---- step可选，默认为1
local begin, finish, step = 0, 10, 3
for i = begin, finish, step do
    --body
    print(i, begin, finish, step)
    --0	0	10	3
    --3	0	10	3
    --6	0	10	3
    --9	0	10	3
end
---- 死循环使用 math.huge
for i = 1, math.huge do
    if i > 3 then
        print(i)
        break
    else
        i = i + 1
        print("i++")
    end
end
---- 遍历数组a
--- 迭代文件每行 io.lines
--- 迭代table元素 pairs
--- 迭代数组元素 ipairs
--- 迭代字符串中单词 string.gmatch
local a = { "a", "b", "c" }
for i, v in ipairs(a) do
    print("index:", i, " value:", v)
end

local days = {
    "Sunday", "Monday", "Tuesday", "Wednesday",
    "Thursday", "Friday", "Saturday"
}
---- 从1开始
print(days[1])
local revDays = {}
for k, v in pairs(days) do
    revDays[v] = k
end
---- 没有顺序
for k, v in pairs(revDays) do
    print("k:", k, " v:", v)
end


-- break  用来终止while、repeat 和 for 三种循环的执行，并跳出当前循环体
sum = 0
i = 0
while true do
    sum = i + sum
    if i >= 10 then
        break
    end
    i = i + 1
end
print(sum)

-- return 用来从函数中返回结果
local function sum(x, y)
    if x <= 0 or y <= 0 then
        print("arg is error.")
        return
    end
    return x + y
end
print(sum(3, 4))
print(sum(3, 0))

local function is_positive(x)
    if x > 0 then
        return x .. " is positive"
    else
        return x .. " is non-positive"
    end

    --由于return只出现在前面显式的语句块，所以此语句不注释也不会报错
    --，但是不会被执行，此处不会产生输出
    print("function end!")
end
local answer = is_positive(-10)
print(answer)

local function foo()
    print("before")
    do
        return
    end
    print("after")  -- 这一行语句永远不会执行到
end
foo()

-- goto  可以用来当成continue用
for i = 1, 3 do
    if i <= 2 then
        print(i, "goto con")
        goto con
    end
    print(i, "no con")
    :: con ::
    print([[end...]])
end
---- 错误处理
local function process(input)
    print("the input is", input)
    if input < 2 then
        goto failed
    end
    -- 更多处理流程和 goto err

    print("processing...")
    do
        return
    end
    :: failed ::
    print("handle error with input", input)
end

process(1)
process(3)