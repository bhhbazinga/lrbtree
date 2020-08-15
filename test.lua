local lrbtree = require "lrbtree"

local rbtree = lrbtree.new(function(a, b)
	return a - b
end)

local t1 = os.clock()
for i = 1, 100000 do
	rbtree:insert(i)
end
local t2 = os.clock()

for idx, v in rbtree:walk() do
--	print(idx, v)
end

local list = rbtree:range(1, 100000)
for idx, v in ipairs(list) do
--	print(idx, v)
end

local t3 = os.clock()
for _, v in rbtree:walk() do
	rbtree:delete(v)
end
local t4 = os.clock()

print("after delete all")
for idx, v in rbtree:walk() do
	print(idx, v)
end

print("insert 100K elements:", t2 - t1)
print("delete 100K elements:", t4 - t3)

local r = lrbtree.new(function(t1, t2) return t1[1] - t2[1] end)
local t1 = {1}
local t2 = {2}
local t3 = {3}
local t4 = {4}
local t5 = {5}

r:insert(t1)
r:insert(t3)
r:insert(t5)
r:insert(t2)
r:insert(t4)

r:delete(t3)

print("--- range")
for i, v in ipairs(r:range(t2, t4)) do
	print(i, v, v[1])
end

print("--- walk")
for i, v in r:walk() do
	print(i, v, v[1])
end
