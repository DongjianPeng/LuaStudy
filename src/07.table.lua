---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by DongjianPeng.
--- DateTime: 2022/6/26/0026 18:20
--- 表格
---
print("------------------分隔线----------------")
local color = { first = "red", "blue", third = "green", "yellow" }
print(color["first"])                 --> output: red
print(color[1])                       --> output: blue
print(color["third"])                 --> output: green
print(color[2])                       --> output: yellow
print(color[3])                       --> output: nil
print(#color) -- 2

local s = { 1, 2, 3, 4, 5, 6 }
print(#s) -- 6
s[4] = nil
print(#s)  -- 3

print("------------------分隔线----------------")
---- 不要在 Lua 的 table 中使用 nil 值，如果一个元素要删除，直接 remove，不要用 nil 去代替。
local tblTest1 = { 1, a = 2, 3 }
print("Test1 " .. table.getn(tblTest1), #tblTest1) -- Test1 2	2

local tblTest2 = { 1, nil }
print("Test2 " .. table.getn(tblTest2))

local tblTest3 = { 1, nil, 2 }
print("Test3 " .. table.getn(tblTest3))

local tblTest4 = { 1, nil, 2, nil }
print("Test4 " .. table.getn(tblTest4))

local tblTest5 = { 1, nil, 2, nil, 3, nil }
print("Test5 " .. table.getn(tblTest5))

local tblTest6 = { 1, nil, 2, nil, 3, nil, 4, nil }
print("Test6 " .. table.getn(tblTest6))

print("------------------分隔线----------------")
-- 拼接
---- table.concat (table [, sep [, i [, j ] ] ])
---- i 起始位置 默认1
---- j 结束位置 默认table长度
local a = { 1, 3, 5, "hello" }
print(table.concat(a))              -- output: 135hello
print(table.concat(a, "|"))         -- output: 1|3|5|hello
print(table.concat(a, " ", 4, 2))   -- output:
print(table.concat(a, " ", 2, 4))   -- output: 3 5 hello

print("------------------分隔线----------------")
-- 插入
---- table.insert (table, [pos ,] value)
---- pos 索引位置插入 value，其它元素向后移动到空的地方
---- 默认值是表长度+1，也就是追加
local a = { 1, 8 }             --a[1] = 1,a[2] = 8
table.insert(a, 1, 3)   --在表索引为1处插入3
print(a[1], a[2], a[3])
table.insert(a, 10)    --在表的最后插入10
print(a[1], a[2], a[3], a[4])

print("------------------分隔线----------------")
-- 返回最大索引编号
---- table.maxn (table)
local a = {}
a[-1] = 10
print(table.maxn(a))  -- 0
a[5] = 10
print(table.maxn(a)) -- 5

print("------------------分隔线----------------")
-- 删除指定索引的元素
---- table.remove (table [, pos])
local a = { 1, 2, 3, 4 }
print(table.remove(a, 1)) --删除速索引为1的元素
print(a[1], a[2], a[3], a[4])

print(table.remove(a))   --删除最后一个元素
print(a[1], a[2], a[3], a[4])

print("------------------分隔线----------------")
-- 排序列表
---- table.sort (table [, comp])

local function compare(x, y)
    --从大到小排序
    return x > y         --如果第一个参数大于第二个就返回true，否则返回false
end
---  如果比较函数 comp 没有给出，默认从小到大排序
local a = { 1, 7, 3, 4, 25 }
table.sort(a)           --默认从小到大排序
print(a[1], a[2], a[3], a[4], a[5])
table.sort(a, compare) --使用比较函数进行排序
print(a[1], a[2], a[3], a[4], a[5])

