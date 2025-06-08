--// Load Sirius UI Library from catdyhub
local Sirius = loadstring(game:HttpGet("https://raw.githubusercontent.com/catdyhub/GUI/main/source.lua"))()
local Window = Sirius:CreateWindow("🌱 Grow a Garden GUI | by Depthso")

--// Global References
local AutoPlantLoop = _G.AutoPlantLoop
local HarvestPlants = _G.HarvestPlants
local BuyAllSelectedSeeds = _G.BuyAllSelectedSeeds
local SellInventory = _G.SellInventory
local GetSeedStock = _G.GetSeedStock
local GetOwnedSeeds = _G.GetOwnedSeeds

--// Globals for Toggles & Settings
local SelectedSeed = ""
local SelectedBuySeed = ""
local SellThresholdValue = 15
local AutoWalkMaxWait = 10

--// Tabs
local PlantTab = Window:AddTab("🌿 Auto-Plant")
local HarvestTab = Window:AddTab("🚜 Auto-Harvest")
local BuyTab = Window:AddTab("🪙 Auto-Buy")
local SellTab = Window:AddTab("💰 Auto-Sell")
local WalkTab = Window:AddTab("🚶 Auto-Walk")

--// Plant Tab
PlantTab:AddDropdown("Select Seed", {}, function(v)
    SelectedSeed = v
    if _G.SelectedSeed then _G.SelectedSeed.Selected = v end
end)

PlantTab:AddToggle("Enabled", false, function(v)
    if _G.AutoPlant then _G.AutoPlant.Value = v end
end)

PlantTab:AddToggle("Plant at random points", false, function(v)
    if _G.AutoPlantRandom then _G.AutoPlantRandom.Value = v end
end)

PlantTab:AddButton("🌱 Plant All", function()
    AutoPlantLoop()
end)

--// Harvest Tab
HarvestTab:AddToggle("Enabled", false, function(v)
    if _G.AutoHarvest then _G.AutoHarvest.Value = v end
end)

HarvestTab:AddLabel("Ignore Variants:")
for _, variant in ipairs({"Normal", "Gold", "Rainbow"}) do
    HarvestTab:AddToggle("Ignore " .. variant, false, function(v)
        _G.HarvestIgnores[variant] = v
    end)
end

--// Buy Tab
BuyTab:AddDropdown("Select Seed", {}, function(v)
    SelectedBuySeed = v
    if _G.SelectedSeedStock then _G.SelectedSeedStock.Selected = v end
end)

BuyTab:AddToggle("Enabled", false, function(v)
    if _G.AutoBuy then _G.AutoBuy.Value = v end
end)

BuyTab:AddToggle("Only Show Stock", false, function(v)
    if _G.OnlyShowStock then _G.OnlyShowStock.Value = v end
end)

BuyTab:AddButton("🛒 Buy All", function()
    BuyAllSelectedSeeds()
end)

--// Sell Tab
SellTab:AddToggle("Enabled", false, function(v)
    if _G.AutoSell then _G.AutoSell.Value = v end
end)

SellTab:AddSlider("Crops Threshold", 1, 199, 15, function(v)
    SellThresholdValue = v
    if _G.SellThreshold then _G.SellThreshold.Value = v end
end)

SellTab:AddButton("🧺 Sell Inventory", function()
    SellInventory()
end)

--// Walk Tab
WalkTab:AddToggle("Enabled", false, function(v)
    if _G.AutoWalk then _G.AutoWalk.Value = v end
end)

WalkTab:AddToggle("Allow Random Points", true, function(v)
    if _G.AutoWalkAllowRandom then _G.AutoWalkAllowRandom.Value = v end
end)

WalkTab:AddToggle("NoClip", false, function(v)
    if _G.NoClip then _G.NoClip.Value = v end
end)

WalkTab:AddSlider("Max Delay (secs)", 1, 120, 10, function(v)
    AutoWalkMaxWait = v
    if _G.AutoWalkMaxWait then _G.AutoWalkMaxWait.Value = v end
end)

--// Keybind
Window:AddKeybind("Toggle UI", Enum.KeyCode.RightControl, function()
    Window:Toggle()
end)

--// Update Dropdowns
local function UpdateDropdowns()
    local seeds = GetSeedStock(true)
    local seedNames = {}
    for k in pairs(seeds) do
        table.insert(seedNames, k)
    end
    PlantTab:UpdateDropdown("Select Seed", seedNames)
    BuyTab:UpdateDropdown("Select Seed", seedNames)
end

UpdateDropdowns()
