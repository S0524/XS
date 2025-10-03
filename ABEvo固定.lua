-- 初始化
gg.clearList()
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)

gg.setVisible(false)

-- 固定血量和攻击力（改成你需要的数值）
local hp  = 1254
local atk = 506

-- 第一步：搜索总血量 (hp*5)
gg.clearResults()
gg.searchNumber(hp*5 .. ";" .. hp*5 .. "::78", gg.TYPE_FLOAT)
local resultsA = gg.getResults(999999)
if #resultsA > 0 then gg.addListItems(resultsA) end

-- 第二步：搜索 血量;攻击::5 并精炼出攻击
gg.clearResults()
gg.searchNumber(hp .. ";" .. atk .. "::5", gg.TYPE_FLOAT)
gg.refineNumber(atk, gg.TYPE_FLOAT)
local resultsB = gg.getResults(999999)
if #resultsB > 0 then gg.addListItems(resultsB) end

-- 修改保存列表里的值
local list = gg.getListItems()
for i, v in ipairs(list) do
  v.value = 100000
  v.freeze = false
end
if #list > 0 then gg.setValues(list) end
gg.clearResults()