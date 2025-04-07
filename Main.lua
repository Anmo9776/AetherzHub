
-- AetherzHub Main Loader
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Module folder structure (will load modules later)
local Modules = {
    "AutoFarm",
    "Teleport",
    "ESP",
    "StatsManager",
    "FastAttack"
}

-- Load UI Library (can swap later for custom one)
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
    Name = "AetherzHub | Blox Fruits",
    LoadingTitle = "AetherzHub",
    LoadingSubtitle = "by Anmo9776",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AetherzHub",
        FileName = "Aetherz_Config"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Tabs
local AutoFarmTab = Window:CreateTab("AutoFarm", 4483362458)
local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local ESPTab = Window:CreateTab("ESP", 4483362458)
local StatsTab = Window:CreateTab("Stats", 4483362458)

-- Require each module if it exists
for _, mod in ipairs(Modules) do
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Anmo9776/AetherzHub/main/Modules/"..mod..".lua"))()
    end)
    if success and result and type(result) == "function" then
        result({
            Player = Player,
            AutoFarmTab = AutoFarmTab,
            TeleportTab = TeleportTab,
            ESPTab = ESPTab,
            StatsTab = StatsTab,
            Window = Window
        })
    else
        warn("Module failed to load:", mod, result)
    end
end
