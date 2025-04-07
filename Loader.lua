
-- AetherzHub Main Loader
local ctx = {
    Player = game.Players.LocalPlayer,
    MainWindow = nil,
    AutoFarmTab = nil,
    VisualTab = nil,
    SettingsTab = nil,
}

-- Load Modules
local function LoadModule(name)
    local s, m = pcall(function()
        return loadstring(readfile("AetherzHub/" .. name .. ".lua"))()
    end)
    if typeof(m) == "function" then
        pcall(function()
            m(ctx)
        end)
    end
end

-- Init UI and Tabs
loadstring(game:HttpGet("https://raw.githubusercontent.com/Anmo9776/AetherzHub/main/UI.lua"))()(ctx)

-- Load Features
local modules = {"Teleport", "ESP", "StatsManager", "AutoFarm"}
for _, mod in ipairs(modules) do
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Anmo9776/AetherzHub/main/" .. mod .. ".lua"))()(ctx)
    end)
end
