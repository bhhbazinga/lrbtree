local lrbtree = require "lrbtree"

local rbtree = lrbtree.new(function(a, b)
	return a - b
end)

local t1 = os.clock()
for i = 1, 100000 do
	rbtree:insert(i)
end
local t2 = os.clock()

local list = rbtree:range(1, 100000)
local t3 = os.clock()
for _, v in ipairs(list) do
	rbtree:delete(v)
end
local t4 = os.clock()

print("insert 100K elements:", t2 - t1)
print("delete 100K elements:", t4 - t3)
